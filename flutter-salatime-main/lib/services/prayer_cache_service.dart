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

  /// Load cached prayer times (ONLY if for today)
  static Future<Map<String, String>?> loadPrayerTimes() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_keyTimes);
    final dateString = prefs.getString(_keyDate);

    if (json == null || dateString == null) return null;

    final cachedDate = DateTime.parse(dateString);
    final now = DateTime.now();

    // ⭐ Check if cache is from today
    final isSameDay =
        cachedDate.year == now.year &&
            cachedDate.month == now.month &&
            cachedDate.day == now.day;

    if (!isSameDay) return null;

    final Map<String, dynamic> decoded = jsonDecode(json);
    return decoded.map((k, v) => MapEntry(k, v.toString()));
  }

  /// Check if cache exists
  static Future<bool> hasCache() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyTimes);
  }

  /// Clear cache manually
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyTimes);
    await prefs.remove(_keyDate);
  }
}