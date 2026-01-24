import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';
import '../services/settings_service.dart';
import '../services/notification_service.dart';
import '../services/time_helper.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, String>? prayerTimes;
  bool loading = true;
  String? error;

  late CalculationMethod selectedMethod;
  late MadhhabType selectedMadhab;
  late int offsetMinutes;

  @override
  void initState() {
    super.initState();
    loadSettingsAndPrayerTimes();
  }

  Future<void> loadSettingsAndPrayerTimes() async {
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

      // Cancel old notifications
      await NotificationService.cancelAll();

      // Schedule notifications for future prayer times
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

      // Force 24-hour format
      final Map<String, String> formatted = {};
      times.forEach((k, v) {
        final parsed = DateFormat('HH:mm').parse(v);
        formatted[k] = DateFormat('HH:mm').format(parsed);
      });

      setState(() {
        prayerTimes = formatted;
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  String _nextPrayer(Map<String, String> times) {
    final now = DateTime.now();
    for (var entry in times.entries) {
      final parsed = DateFormat('HH:mm').parse(entry.value);
      final timeToday = DateTime(
          now.year, now.month, now.day, parsed.hour, parsed.minute);
      if (timeToday.isAfter(now)) {
        return entry.key;
      }
    }
    return times.entries.first.key; // fallback
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
    final nextPrayer = prayerTimes != null ? _nextPrayer(prayerTimes!) : '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prayer Times"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await Navigator.pushNamed(context, '/settings');

              setState(() {
                loading = true;
                error = null;
              });

              await loadSettingsAndPrayerTimes();
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
            : error != null
            ? Center(
          child: Text(
            error!,
            style: const TextStyle(color: Colors.white),
          ),
        )
            : ListView(
          padding: const EdgeInsets.all(16),
          children: prayerTimes!.entries.map((entry) {
            final isNext = entry.key == nextPrayer;
            return Card(
              elevation: isNext ? 8 : 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              color: isNext ? Colors.white : Colors.white70,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                  isNext ? Colors.teal : Colors.grey[200],
                  child: Icon(
                    _getIcon(entry.key),
                    color: isNext ? Colors.white : Colors.black54,
                  ),
                ),
                title: Text(
                  entry.key,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isNext ? Colors.teal : Colors.black87,
                  ),
                ),
                trailing: Text(
                  entry.value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isNext ? Colors.teal : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
