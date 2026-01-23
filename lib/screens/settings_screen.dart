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
  late CalculationMethod selectedMethod;
  late MadhhabType selectedMadhab;
  late int offsetMinutes;

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
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D6E6A), Color(0xFF2BC4C0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Prayer Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Calculation method dropdown
                  DropdownButtonFormField<CalculationMethod>(
                    value: selectedMethod,
                    decoration: const InputDecoration(
                      labelText: "Calculation Method",
                      border: OutlineInputBorder(),
                    ),
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

                  const SizedBox(height: 16),

                  // Madhhab dropdown
                  DropdownButtonFormField<MadhhabType>(
                    value: selectedMadhab,
                    decoration: const InputDecoration(
                      labelText: "Madhhab",
                      border: OutlineInputBorder(),
                    ),
                    items: MadhhabType.values.map((madhab) {
                      return DropdownMenuItem(
                        value: madhab,
                        child: Text(madhab.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMadhab = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Offset slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Offset (minutes)"),
                      Text("$offsetMinutes min"),
                    ],
                  ),
                  Slider(
                    value: offsetMinutes.toDouble(),
                    min: 0,
                    max: 60,
                    divisions: 12,
                    label: "$offsetMinutes",
                    onChanged: (value) {
                      setState(() {
                        offsetMinutes = value.toInt();
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: saveSettings,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Save Settings",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
