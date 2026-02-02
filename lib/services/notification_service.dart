import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // 🔕 USED BY SETTINGS SCREEN
  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // 🔔 SCHEDULE SINGLE NOTIFICATION
  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_channel',
          'Prayer Times',
          channelDescription: 'Prayer time reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // 🔁 daily
    );
  }

  // 🔔 USED BY SETTINGS SCREEN
  static Future<void> scheduleAllPrayerNotifications() async {
    // ⚠️ TEMP EXAMPLE — replace with real prayer times
    final now = DateTime.now();

    await cancelAllNotifications();

    await scheduleNotification(
      id: 1,
      title: 'Prayer Time',
      body: 'It’s time for Fajr',
      scheduledDate: DateTime(now.year, now.month, now.day, 5, 0),
    );

    await scheduleNotification(
      id: 2,
      title: 'Prayer Time',
      body: 'It’s time for Dhuhr',
      scheduledDate: DateTime(now.year, now.month, now.day, 13, 0),
    );

    await scheduleNotification(
      id: 3,
      title: 'Prayer Time',
      body: 'It’s time for Asr',
      scheduledDate: DateTime(now.year, now.month, now.day, 17, 0),
    );

    await scheduleNotification(
      id: 4,
      title: 'Prayer Time',
      body: 'It’s time for Maghrib',
      scheduledDate: DateTime(now.year, now.month, now.day, 19, 30),
    );

    await scheduleNotification(
      id: 5,
      title: 'Prayer Time',
      body: 'It’s time for Isha',
      scheduledDate: DateTime(now.year, now.month, now.day, 21, 0),
    );
  }
}