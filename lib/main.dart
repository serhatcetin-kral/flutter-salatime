import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'services/notification_service.dart';
import 'screens/prayer_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notifications
  await NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salat Times',
      debugShowCheckedModeBanner: false, // removes DEBUG banner
      initialRoute: '/',
      routes: {
        '/': (context) => const PrayerScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
