import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';
import '../models/settings_models.dart';

class SettingsService {
  static const String _key = "settings";

  static Future<void> saveSettings(SettingsModel settings) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(settings.toJson()));
  }

  static Future<SettingsModel> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);

    if (saved == null) {
      return SettingsModel(
        method: CalculationMethod.isna,
        madhab: MadhhabType.shafiGroup,
        offsetMinutes: 0,
      );
    }

    return SettingsModel.fromJson(jsonDecode(saved));
  }
}
