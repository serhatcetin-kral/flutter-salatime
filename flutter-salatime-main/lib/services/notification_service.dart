import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:intl/intl.dart';
import 'dart:io';

import '../models/madhhab_type.dart';
import '../services/settings_service.dart';
import '../services/location_service.dart';
import '../services/prayer_api_service.dart';
import '../models/calculation_method.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // ⭐ This is why we need 'import 'dart:io';'
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  // ⭐ ADD THIS: Call this from a button in your Menu to test immediately!
  static Future<void> sendInstantTestNotification() async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'test_channel', 'Test',
        importance: Importance.max, priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
    );

    await flutterLocalNotificationsPlugin.show(
      888, 'Test Notification', 'If you see this, notifications are working!',
      platformChannelSpecifics,
    );
  }

  static int _getApiMethodId(CalculationMethod method) {
    switch (method) {
      case CalculationMethod.karachi: return 1;
      case CalculationMethod.isna: return 2;
      case CalculationMethod.mwl: return 3;
      case CalculationMethod.makkah: return 4;
      case CalculationMethod.egypt: return 5;
      case CalculationMethod.turkish: return 13;
      default: return 2;
    }
  }

  ///
  static Future<void> scheduleAllPrayerNotifications() async {
    try {
      await flutterLocalNotificationsPlugin.cancelAll();

      final settings = await SettingsService.loadSettings();
      final pos = await LocationService.getUserLocation();
      final methodId = _getApiMethodId(settings.method);

      final times = await PrayerApiService.getPrayerTimes(
        latitude: pos.latitude, longitude: pos.longitude,
        method: methodId, school: settings.madhab.schoolValue,
        offsetMinutes: settings.offsetMinutes,
      );

      final now = DateTime.now();
      final prayerNames = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];

      for (int i = 0; i < prayerNames.length; i++) {
        String name = prayerNames[i];
        if (times.containsKey(name)) {
          final parsed = DateFormat("HH:mm").parse(times[name]!);

          // ⭐ FIX: Calculate for TODAY
          var scheduleDate = DateTime(now.year, now.month, now.day, parsed.hour, parsed.minute);

          // ⭐ FIX: If the time has already passed today, schedule it for TOMORROW
          if (scheduleDate.isBefore(now)) {
            scheduleDate = scheduleDate.add(const Duration(days: 1));
          }

          await flutterLocalNotificationsPlugin.zonedSchedule(
            i,
            'Prayer Time: $name',
            'It is time for $name',
            tz.TZDateTime.from(scheduleDate, tz.local),
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'prayer_channel', 'Prayer Times',
                importance: Importance.max, priority: Priority.high,
                // sound: RawResourceAndroidNotificationSound('adhan'),  // Ensure this exists or remove
              ),
              iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
            ),
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
            matchDateTimeComponents: DateTimeComponents.time,
          );
          //for test


          ////
        }
      }
      print("Successfully scheduled ${prayerNames.length} prayers.");
    } catch (e) {
      print("Notification Error: $e");
    }
  }
}