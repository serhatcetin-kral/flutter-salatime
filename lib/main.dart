
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'screens/calendar_screen.dart';
import 'screens/prayer_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/zikr_screen.dart';
import 'screens/qibla_compass_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/about_screen.dart';
import 'screens/dua_screen.dart';

import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize timezone database
  tz.initializeTimeZones();

  // Lock orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Date formatting
  await initializeDateFormatting();

  // Initialize notifications
  await NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salat Times',

      // Apple review safe start
      initialRoute: '/',

      routes: {
        '/': (context) => const PrayerScreen(),
        '/splash': (context) => const SplashScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/zikr': (context) => const ZikrScreen(),
        '/qibla': (context) => const QiblaCompassScreen(),
        '/menu': (context) => const MenuScreen(),
        '/about': (context) => const AboutScreen(),
        '/duas': (context) => const DuaScreen(),
      },
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:timezone/data/latest_all.dart' as tz; // ⭐ Added for Notifications
// import 'package:timezone/timezone.dart' as tz;           // ⭐ Added for Notifications
//
// import 'screens/calendar_screen.dart';
// import 'screens/prayer_screen.dart';
// import 'screens/settings_screen.dart';
// import 'screens/splash_screen.dart';
// import 'screens/zikr_screen.dart';
// import 'screens/qibla_compass_screen.dart';
// import 'screens/menu_screen.dart';
// import 'screens/about_screen.dart';
// import 'screens/dua_screen.dart';
// import 'services/notification_service.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // 1. Initialize Timezones (Required for scheduled Prayer Notifications)
//   tz.initializeTimeZones();
//
//   // 2. Set preferred orientations
//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//
//   // 3. Initialize formatting and services
//   await initializeDateFormatting();
//
//   // 4. Initialize Notifications and Request Permission
//   await NotificationService.init();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Salat Times',
//       // ⭐ Keeping '/' as initial route for Apple Store safety as we discussed
//       initialRoute: '/',
//       routes: {
//         '/splash': (context) => const SplashScreen(),
//         '/': (context) => const PrayerScreen(),
//         '/settings': (context) => const SettingsScreen(),
//         '/calendar': (context) => const CalendarScreen(),
//         '/zikr': (context) => const ZikrScreen(),
//         '/qibla': (context) => const QiblaCompassScreen(),
//         '/menu': (context) => const MenuScreen(),
//         '/about': (context) => const AboutScreen(),
//         '/duas': (context) => const DuaScreen(),
//       },
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:intl/date_symbol_data_local.dart';
// //
// // import 'screens/calendar_screen.dart';
// // import 'screens/prayer_screen.dart';
// // import 'screens/settings_screen.dart';
// // import 'screens/splash_screen.dart';
// // import 'screens/zikr_screen.dart';
// // import 'screens/qibla_compass_screen.dart';
// // import 'screens/menu_screen.dart';
// // import 'screens/about_screen.dart';
// // import 'screens/dua_screen.dart';
// // import 'services/notification_service.dart';
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //
// //   // Set orientations
// //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// //
// //   // Start these, but don't let them block the app launch if they take too long
// //   initializeDateFormatting();
// //   NotificationService.init();
// //
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Salat Times',
// //       // ⭐ CHANGE THIS: Go to '/' directly to satisfy Apple's "Single Screen" rule
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => const PrayerScreen(),
// //         '/splash': (context) => const SplashScreen(),
// //         '/settings': (context) => const SettingsScreen(),
// //         '/calendar': (context) => const CalendarScreen(),
// //         '/zikr': (context) => const ZikrScreen(),
// //         '/qibla': (context) => const QiblaCompassScreen(),
// //         '/menu': (context) => const MenuScreen(),
// //         '/about': (context) => const AboutScreen(),
// //         '/duas': (context) => const DuaScreen(),
// //       },
// //     );
// //   }
// // }
//
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// //   await initializeDateFormatting();
// //   await NotificationService.init();
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Salat Times',
// //       initialRoute: '/splash',
// //       routes: {
// //         '/splash': (context) => const SplashScreen(),
// //         '/': (context) => const PrayerScreen(),
// //         '/settings': (context) => const SettingsScreen(),
// //         '/calendar': (context) => const CalendarScreen(),
// //         '/zikr': (context) => const ZikrScreen(),
// //         '/qibla': (context) => const QiblaCompassScreen(),
// //         '/menu': (context) => const MenuScreen(),
// //         '/about': (context) => const AboutScreen(),
// //         '/duas': (context) => const DuaScreen(),
// //       },
// //     );
// //   }
// // }
//
