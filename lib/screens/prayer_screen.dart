import 'package:flutter/material.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, String>? prayerTimes;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadPrayerTimes();
  }

  Future<void> loadPrayerTimes() async {
    try {
      final position = await LocationService.getUserLocation();
      final times =
      await PrayerApiService.getPrayerTimes(position.latitude, position.longitude);

      setState(() {
        prayerTimes = times;
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
      appBar: AppBar(title: const Text("Prayer Times")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(child: Text(error!))
          : ListView(
        padding: const EdgeInsets.all(16),
        children: prayerTimes!.entries.map((entry) {
          return Card(
            child: ListTile(
              title: Text(entry.key,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Text(entry.value, style: const TextStyle(fontSize: 18)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
