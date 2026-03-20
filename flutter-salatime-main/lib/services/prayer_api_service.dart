import 'dart:convert';
import 'package:http/http.dart' as http;

class PrayerApiService {
  static Future<Map<String, String>> getPrayerTimes({
    required double latitude,
    required double longitude,
    required int method,
    required int school,
    required int offsetMinutes,
  }) async {

    final url =
        'https://api.aladhan.com/v1/timings'
        '?latitude=$latitude'
        '&longitude=$longitude'
        '&method=$method'
        '&school=$school';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load prayer times');
    }

    final data = jsonDecode(response.body)['data']['timings'];
    final Map<String, String> result = {};

    data.forEach((key, value) {
      final parts = value.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      // REMOVE OFFSET FOR TESTING
      // minute = minute + offsetMinutes;

      hour = (hour + minute ~/ 60) % 24;
      minute = minute % 60;

      result[key] =
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    });

    return result;
  }
}
