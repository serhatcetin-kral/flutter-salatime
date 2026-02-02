import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/hijri_utils.dart';
import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';
import '../services/settings_service.dart';
import '../services/notification_service.dart';
import '../services/prayer_cache_service.dart';
import '../services/time_helper.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, String>? prayerTimes;
  bool loading = true;

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
      final settings = await SettingsService.loadSettings();
      selectedMethod = settings.method;
      selectedMadhab = settings.madhab;
      offsetMinutes = settings.offsetMinutes;

      final position = await LocationService.getUserLocation();

      final times = await PrayerApiService.getPrayerTimes(
        latitude: position.latitude,
        longitude: position.longitude,
        method: getMethodId(selectedMethod),
        school: selectedMadhab.schoolValue,
        offsetMinutes: offsetMinutes,
      );

      // 💾 Save for offline use
      await PrayerCacheService.savePrayerTimes(
        times,
        DateTime.now(),
      );

      // 🔔 Notifications
      await NotificationService.cancelAllNotifications();
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
          body: "$prayerName is now",
          scheduledDate: scheduled,
        );
      });

      setState(() {
        prayerTimes = times;
        loading = false;
        status = null;
      });

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
    final locale = Localizations.localeOf(context).languageCode;
    final hijriDate = HijriUtils.getTodayHijriDate(locale: locale);
    final gregorianDate =
    DateFormat.yMMMMEEEEd(locale).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prayer Times"),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => Navigator.pushNamed(context, '/calendar'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await Navigator.pushNamed(context, '/settings');
              loadSettingsAndPrayerTimes();
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF81D4FA), Color(0xFFB2EBF2)],
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
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Next Prayer: $_nextPrayerName",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _formatDuration(_timeUntilNextPrayer!),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 12),

            // 🕌 Prayer list
            ...prayerTimes!.entries.map((entry) {
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(
                      _getIcon(entry.key),
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    entry.value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
