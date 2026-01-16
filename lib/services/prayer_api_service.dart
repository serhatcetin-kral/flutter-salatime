import 'dart:convert';
import 'package:http/http.dart' as http;

class PrayerApiService {
  static Future<Map<String, String>> getPrayerTimes(double lat, double lon) async {
    final url =
     'https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$lon&method=2&school=1&adjustmentHighLats=1';

    // 'https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$lon&method=2';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['timings'];
      return Map<String, String>.from(data);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
