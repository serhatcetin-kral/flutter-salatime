import 'package:flutter/material.dart';
import 'screens/prayer_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sala Times',
      debugShowCheckedModeBanner: false, // ✅ Hide debug banner
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PrayerScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
