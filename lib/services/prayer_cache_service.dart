import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerCacheService {
  static const String _keyTimes = 'cached_prayer_times';
  static const String _keyDate = 'cached_prayer_date';

  /// Save prayer times locally
  static Future<void> savePrayerTimes(
      Map<String, String> times,
      DateTime date,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTimes, jsonEncode(times));
    await prefs.setString(_keyDate, date.toIso8601String());
  }

  /// Load cached prayer times
  static Future<Map<String, String>?> loadPrayerTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_keyTimes);
    if (json == null) return null;

    final Map<String, dynamic> decoded = jsonDecode(json);
    return decoded.map((k, v) => MapEntry(k, v.toString()));
  }

  /// Check if cache exists
  static Future<bool> hasCache() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyTimes);
  }
}
