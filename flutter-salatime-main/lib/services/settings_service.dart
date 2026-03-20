import 'package:shared_preferences/shared_preferences.dart';
import '../models/settings_models.dart';
import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';

class SettingsService {
  static Future<void> saveSettings(SettingsModel settings) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('method', settings.method.name);
    await prefs.setString('madhab', settings.madhab.name);
    await prefs.setInt('offsetMinutes', settings.offsetMinutes);

    await prefs.setBool('widget_enabled', settings.widgetEnabled);
    await prefs.setBool('lock_enabled', settings.lockScreenEnabled);


    // 🌙 NEW: Ramadan notifications toggle
    await prefs.setBool(
      'ramadanNotificationsEnabled',
      settings.ramadanNotificationsEnabled,
    );
  }

  static Future<SettingsModel> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final methodName = prefs.getString('method') ?? 'isna';
    final madhabName = prefs.getString('madhab') ?? 'shafiGroup';
    final offset = prefs.getInt('offsetMinutes') ?? 0;

    // 🌙 NEW: Load Ramadan notifications toggle
    final ramadanEnabled =
        prefs.getBool('ramadanNotificationsEnabled') ?? true;

    final method = CalculationMethod.values.firstWhere(
          (e) => e.name == methodName,
      orElse: () => CalculationMethod.isna,
    );

    final madhab = MadhhabType.values.firstWhere(
          (e) => e.name == madhabName,
      orElse: () => MadhhabType.shafiGroup,
    );

    return SettingsModel(
      method: method,
      madhab: madhab,
      offsetMinutes: offset,
      ramadanNotificationsEnabled: ramadanEnabled,
    );
  }
}
