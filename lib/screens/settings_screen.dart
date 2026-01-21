import 'package:flutter/material.dart';
import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../models/settings_models.dart';
import '../services/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  CalculationMethod selectedMethod = CalculationMethod.isna;
  MadhhabType selectedMadhab = MadhhabType.shafiGroup;
  int offsetMinutes = 0;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final settings = await SettingsService.loadSettings();
    setState(() {
      selectedMethod = settings.method;
      selectedMadhab = settings.madhab;
      offsetMinutes = settings.offsetMinutes;
    });
  }

  Future<void> saveSettings() async {
    final settings = SettingsModel(
      method: selectedMethod,
      madhab: selectedMadhab,
      offsetMinutes: offsetMinutes,
    );

    await SettingsService.saveSettings(settings);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Calculation Method"),
            DropdownButton<CalculationMethod>(
              value: selectedMethod,
              items: CalculationMethod.values.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Madhhab"),
            DropdownButton<MadhhabType>(
              value: selectedMadhab,
              items: MadhhabType.values.map((madhab) {
                return DropdownMenuItem(
                  value: madhab,
                  child: Text(madhab.nameText),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMadhab = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Offset Minutes (all prayers)"),
            Slider(
              value: offsetMinutes.toDouble(),
              min: -60,
              max: 60,
              divisions: 120,
              label: offsetMinutes.toString(),
              onChanged: (value) {
                setState(() {
                  offsetMinutes = value.toInt();
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveSettings,
              child: const Text("Save Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
