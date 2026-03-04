import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../models/settings_models.dart';
import '../services/prayer_cache_service.dart';
import '../services/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late CalculationMethod selectedMethod;
  late MadhhabType selectedMadhab;
  late int offsetMinutes;

  bool prayerNotificationsEnabled = true;
  bool widgetEnabled = false;
  bool lockScreenEnabled = false;
  bool ramadanNotificationsEnabled = true;
  bool showNightTimes = false; // ⭐ NEW VARIABLE

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final settings = await SettingsService.loadSettings();
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedMethod = settings.method;
      selectedMadhab = settings.madhab;
      offsetMinutes = settings.offsetMinutes;

      ramadanNotificationsEnabled = settings.ramadanNotificationsEnabled;

      prayerNotificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
      widgetEnabled = prefs.getBool('widget_enabled') ?? false;
      lockScreenEnabled = prefs.getBool('lock_enabled') ?? false;

      // ⭐ LOAD THE NEW PREFERENCE
      showNightTimes = prefs.getBool('show_night_times') ?? false;

      _isLoading = false;
    });
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final settings = SettingsModel(
      method: selectedMethod,
      madhab: selectedMadhab,
      offsetMinutes: offsetMinutes,
      ramadanNotificationsEnabled: ramadanNotificationsEnabled,
    );

    // ⭐ SAVE ALL TO PREFS
    await SettingsService.saveSettings(settings);
    await prefs.setBool('notifications_enabled', prayerNotificationsEnabled);
    await prefs.setBool('show_night_times', showNightTimes); // ⭐ SAVE NIGHT TIMES

    await PrayerCacheService.clear();

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0D6E6A), Color(0xFF2BC4C0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        "Prayer Settings",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 20),

                      // --- Calculation Method Dropdown ---
                      DropdownButtonFormField<CalculationMethod>(
                        value: selectedMethod,
                        decoration: const InputDecoration(labelText: "Calculation Method", border: OutlineInputBorder()),
                        items: CalculationMethod.values.map((method) {
                          return DropdownMenuItem(value: method, child: Text(method.displayName));
                        }).toList(),
                        onChanged: (value) => setState(() => selectedMethod = value!),
                      ),
                      const SizedBox(height: 16),

                      // --- Madhhab Dropdown ---
                      DropdownButtonFormField<MadhhabType>(
                        value: selectedMadhab,
                        decoration: const InputDecoration(labelText: "Madhhab", border: OutlineInputBorder()),
                        items: MadhhabType.values.map((madhab) {
                          return DropdownMenuItem(value: madhab, child: Text(madhab.name));
                        }).toList(),
                        onChanged: (value) => setState(() => selectedMadhab = value!),
                      ),
                      const SizedBox(height: 16),

                      // --- Offset Slider ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text("Offset (minutes)"), Text("$offsetMinutes min")],
                      ),
                      Slider(
                        value: offsetMinutes.toDouble(),
                        min: 0, max: 60, divisions: 12,
                        label: "$offsetMinutes",
                        onChanged: (value) => setState(() => offsetMinutes = value.toInt()),
                      ),
                      const Divider(),

                      // ⭐ NEW: Show Nightly Times Toggle
                      SwitchListTile(
                        value: showNightTimes,
                        title: const Text("Show Nightly Times"),
                        subtitle: const Text("Display Midnight & Last Third of Night"),
                        secondary: const Icon(Icons.nights_stay, color: Colors.indigo),
                        onChanged: (value) => setState(() => showNightTimes = value),
                      ),

                      SwitchListTile(
                        value: prayerNotificationsEnabled,
                        title: const Text("Prayer Notifications"),
                        subtitle: const Text("Receive reminders at prayer times"),
                        onChanged: (value) => setState(() => prayerNotificationsEnabled = value),
                      ),

                      SwitchListTile(
                        value: ramadanNotificationsEnabled,
                        title: const Text("Ramadan Notifications"),
                        subtitle: const Text("Suhoor & Iftar reminders"),
                        onChanged: (value) => setState(() => ramadanNotificationsEnabled = value),
                      ),

                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: saveSettings,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text("Save Settings", style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}