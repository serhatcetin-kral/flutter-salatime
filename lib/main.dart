import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/calendar_screen.dart';

import 'theme/app_theme.dart';
import 'screens/prayer_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'services/notification_service.dart';
import 'screens/zikr_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ FIX: Initialize Intl locale data
  await initializeDateFormatting();

  // 🔔 Initialize notifications
  await NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salat Times',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const PrayerScreen(),
        '/prayerTime': (context) => const PrayerScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/zikr': (context) => const ZikrScreen(),


      },
    );
  }
}