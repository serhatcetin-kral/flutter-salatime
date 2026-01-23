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

  @override
  Widget build(BuildContext context) {
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
      body: loading
          ? Container(
        color: Colors.teal,
        child: const Center(
          child: Text(
            "Location gathering...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
          : error != null
          ? Center(child: Text(error!))
          : ListView(
        padding: const EdgeInsets.all(16),
        children: prayerTimes!.entries.map((entry) {
          return Card(
            child: ListTile(
              title: Text(
                entry.key,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                entry.value,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
