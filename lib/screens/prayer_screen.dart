import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/location_name_service.dart';
import '../utils/hijri_utils.dart';
import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';
import '../services/settings_service.dart';
import '../services/notification_service.dart';
import '../services/prayer_cache_service.dart';
import '../services/time_helper.dart';
import '../utils/ramadan_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();

}

class _PrayerScreenState extends State<PrayerScreen> {
  bool lockScreenEnabled = false;
  Map<String, String>? prayerTimes;
  bool loading = true;
  String? locationName;


  String? _getNextPrayerName(Map<String, String> times) {
    final now = DateTime.now();

    for (final entry in times.entries) {
      final parsed = DateFormat('HH:mm').parse(entry.value);
      final prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        parsed.hour,
        parsed.minute,
      );

      if (prayerTime.isAfter(now)) {
        return entry.key;
      }
    }

    // If all prayers passed → tomorrow's Fajr
    return times.keys.first;
  }

  // null = online or normal
  // "offline" = using cached data
  // any other string = real error
  String? status;

  late CalculationMethod selectedMethod;
  late MadhhabType selectedMadhab;
  late int offsetMinutes;

  // ⏳ Countdown
  Timer? _countdownTimer;
  Duration? _timeUntilNextPrayer;
  String? _nextPrayerName;

  @override
  void initState() {
    super.initState();
    loadSettingsAndPrayerTimes();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> loadSettingsAndPrayerTimes() async {
    setState(() {
      loading = true;
      status = null;
    });

    try {
      // 1️⃣ Load settings
      final settings = await SettingsService.loadSettings();
      selectedMethod = settings.method;
      selectedMadhab = settings.madhab;
      offsetMinutes = settings.offsetMinutes;

      // 🔒 Load lock-screen toggle
      final prefs = await SharedPreferences.getInstance();
      lockScreenEnabled = prefs.getBool('lock_enabled') ?? false;

      // 2️⃣ Location
      final position = await LocationService.getUserLocation();
      final fetchedLocationName =
      await LocationNameService.getLocationName(
        position.latitude,
        position.longitude,
      );

      setState(() {
        locationName = fetchedLocationName;
      });

      // 3️⃣ Fetch prayer times
      final times = await PrayerApiService.getPrayerTimes(
        latitude: position.latitude,
        longitude: position.longitude,
        method: getMethodId(selectedMethod),
        school: selectedMadhab.schoolValue,
        offsetMinutes: offsetMinutes,
      );

      // Remove Sunset (same as Maghrib)
      times.remove('Sunset');

      // 💾 Cache for offline
      await PrayerCacheService.savePrayerTimes(
        times,
        DateTime.now(),
      );

      // 🔔 Clear old notifications (ONCE)
      await NotificationService.cancelAllNotifications();

      // 4️⃣ Prayer notifications
      times.forEach((prayerName, prayerTime) {
        final parsed = DateFormat('HH:mm').parse(prayerTime);
        final scheduled = nextOccurrence(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          parsed.hour,
          parsed.minute,
        ));

        NotificationService.scheduleNotification(
          id: prayerName.hashCode,
          title: "Prayer Time",
          body: "It is time for $prayerName prayer 🕌",
          scheduledDate: scheduled,
        );
      });

      // 5️⃣ 🌙 Ramadan notifications (ONCE, outside loop)
      if (settings.ramadanNotificationsEnabled &&
          RamadanUtils.isRamadanToday()) {
        final now = DateTime.now();

        // 🥣 Suhoor
        if (times.containsKey("Fajr")) {
          final fajrParsed = DateFormat('HH:mm').parse(times["Fajr"]!);
          DateTime fajrTime = DateTime(
            now.year,
            now.month,
            now.day,
            fajrParsed.hour,
            fajrParsed.minute,
          );

          if (fajrTime.isBefore(now)) {
            fajrTime = fajrTime.add(const Duration(days: 1));
          }

          final suhoor = RamadanUtils.suhoorTime(fajrTime);

          NotificationService.scheduleNotification(
            id: 9001,
            title: "Suhoor Reminder",
            body: "Time for Suhoor 🌙",
            scheduledDate: suhoor,
          );
        }

        // 🌇 Iftar
        if (times.containsKey("Maghrib")) {
          final maghribParsed =
          DateFormat('HH:mm').parse(times["Maghrib"]!);
          DateTime maghribTime = DateTime(
            now.year,
            now.month,
            now.day,
            maghribParsed.hour,
            maghribParsed.minute,
          );

          if (maghribTime.isBefore(now)) {
            maghribTime = maghribTime.add(const Duration(days: 1));
          }

          NotificationService.scheduleNotification(
            id: 9002,
            title: "Iftar Time",
            body: "It’s time to break your fast 🌇",
            scheduledDate: maghribTime,
          );
        }
      }

      // 6️⃣ Update UI
      setState(() {
        prayerTimes = times;
        loading = false;
        status = null;
      });

      // 7️⃣ Countdown + lock-screen update handled here
      _startNextPrayerCountdown(times);

    } catch (_) {
      // 🌐 Online failed → try offline
      final cached = await PrayerCacheService.loadPrayerTimes();

      if (cached != null) {
        setState(() {
          prayerTimes = cached;
          loading = false;
          status = "offline";
        });

        _startNextPrayerCountdown(cached);
      } else {
        setState(() {
          loading = false;
          status = "No internet connection";
        });
      }
    }
  }


  // ⏳ Countdown logic
  void _startNextPrayerCountdown(Map<String, String> times) {
    _countdownTimer?.cancel();

    void update() {
      final now = DateTime.now();

      for (final entry in times.entries) {
        final parsed = DateFormat('HH:mm').parse(entry.value);
        final timeToday = DateTime(
          now.year,
          now.month,
          now.day,
          parsed.hour,
          parsed.minute,
        );

        if (timeToday.isAfter(now)) {
          setState(() {
            _nextPrayerName = entry.key;
            _timeUntilNextPrayer = timeToday.difference(now);
          });

          // 🔒 Lock-screen persistent notification (OPTIONAL)
          if (lockScreenEnabled && prayerTimes != null) {
            NotificationService.showPersistentNextPrayer(
              prayer: entry.key,
              time: times[entry.key]!,
            );
          }

          return;
        }

      }

      final first = times.entries.first;
      final parsed = DateFormat('HH:mm').parse(first.value);
      final tomorrow = DateTime(
        now.year,
        now.month,
        now.day + 1,
        parsed.hour,
        parsed.minute,
      );

      setState(() {
        _nextPrayerName = first.key;
        _timeUntilNextPrayer = tomorrow.difference(now);
      });
    }

    update();
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => update());
  }

  String _formatDuration(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  IconData _getIcon(String prayer) {
    switch (prayer.toLowerCase()) {
      case 'fajr':
        return Icons.brightness_3;
      case 'dhuhr':
        return Icons.wb_sunny;
      case 'asr':
        return Icons.brightness_5;
      case 'maghrib':
        return Icons.nightlight_round;
      case 'isha':
        return Icons.nights_stay;
      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextPrayerName =
    prayerTimes != null ? _getNextPrayerName(prayerTimes!) : null;

    final locale = Localizations.localeOf(context).languageCode;
    final hijriDate = HijriUtils.getTodayHijriDate(locale: locale);
    final gregorianDate =
    DateFormat.yMMMMEEEEd(locale).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          "Prayer Times",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // 🧭 Qibla (keep visible)
          IconButton(
            icon: const Icon(Icons.explore),
            onPressed: () => Navigator.pushNamed(context, '/qibla'),
          ),
          IconButton(
            icon: Image.asset(
              'assets/tesbih.png',
              width: 26,
              height: 26,
              color: null, // remove this if image is already colored
            ),
            tooltip: "Zikirmatik",
            onPressed: () => Navigator.pushNamed(context, '/zikr'),
          ),



          // ⋮ More menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) async {
              if (value == 'calendar') {
                Navigator.pushNamed(context, '/calendar');
              } else if (value == 'settings') {
                await Navigator.pushNamed(context, '/settings');
                loadSettingsAndPrayerTimes();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'calendar',
                child: Text('Calendar'),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),


      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF102027), // deep night blue
              Color(0xFF1E3C45), // teal-blue
              Color(0xFF2E5964), // soft mosque night
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),



        child: loading
            ? const Center(
          child: CircularProgressIndicator(color: Colors.white),
        )
            : status != null && status != "offline"
            ? Center(
          child: Text(
            status!,
            style: const TextStyle(color: Colors.white),
          ),
        )
            : ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (RamadanUtils.isRamadanToday())
              Card(
                elevation: 6,
                color: const Color(0xFFFFF8E1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      const Text(
                        "🌙 Ramadan Mubarak",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${RamadanUtils.remainingRamadanDays()} days remaining",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // 📴 Offline banner
            if (status == "offline")
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Offline mode – showing last saved prayer times",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            // 📍 LOCATION NAME (ADD HERE)
            if (locationName != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 18,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      locationName!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

            // 🌙 Dates
            Column(
              children: [
                Text(
                  hijriDate,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  gregorianDate,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),

            // ⏳ Countdown
            if (_nextPrayerName != null &&
                _timeUntilNextPrayer != null)
              Card(
                elevation: 10,
                color: const Color(0xFFE0F2F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Text(
                        "Next Prayer • $_nextPrayerName",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _formatDuration(_timeUntilNextPrayer!),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),



            const SizedBox(height: 12),

            // 🕌 Prayer list
            ...prayerTimes!.entries.map((entry) {
              final isNext = entry.key == nextPrayerName;

              return Card(
                elevation: isNext ? 8 : 3,
                color: isNext ? const Color(0xFFE0F2F1) : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: isNext
                          ? Colors.teal.withOpacity(0.25)
                          : Colors.teal.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      _getIcon(entry.key),
                      color: Colors.teal,
                    ),
                  ),
                  title: Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: isNext ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: isNext ? FontWeight.bold : FontWeight.w600,
                      color: isNext ? Colors.teal : Colors.black87,
                    ),
                  ),
                ),
              );
            }).toList(),

          ],
        ),
      ),
    );
  }
}
