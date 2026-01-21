import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../models/settings_models.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';
import '../services/settings_service.dart';
import 'settings_screen.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, String>? prayerTimes;
  bool loading = true;
  String? error;

  late SettingsModel settings;

  @override
  void initState() {
    super.initState();
    loadSettingsAndPrayerTimes();
  }

  Future<void> loadSettingsAndPrayerTimes() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      // Load settings
      settings = await SettingsService.loadSettings();

      // Get location
      final position = await LocationService.getUserLocation();

      // Get prayer times
      final times = await PrayerApiService.getPrayerTimes(
        latitude: position.latitude,
        longitude: position.longitude,
        method: getMethodId(settings.method),
        school: settings.madhab.schoolValue,
        offsetMinutes: settings.offsetMinutes,
      );

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
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
              // Refresh after returning from settings
              loadSettingsAndPrayerTimes();
            },
          )
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
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