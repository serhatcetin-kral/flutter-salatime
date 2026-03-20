import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // Make sure to add: flutter pub add share_plus
import '../utils/page_transition.dart';
import '../screens/about_screen.dart';
import '../screens/zikr_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/qibla_compass_screen.dart';
import 'dua_screen.dart';
import '../services/notification_service.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  Widget _getPage(String route) {
    switch (route) {
      case '/zikr': return const ZikrScreen();
      case '/calendar': return const CalendarScreen();
      case '/qibla': return const QiblaCompassScreen();
      case '/about': return const AboutScreen();
      case '/duas': return const DuaScreen();
      default: return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More", style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF102027), Color(0xFF1E3C45), Color(0xFF2E5964)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          children: [
            _sectionTitle("Tools"),
            _menuTile(context, icon: Icons.explore, title: "Qibla Finder", subtitle: "Direction of the Kaaba", route: '/qibla'),
            _menuTile(context, icon: Icons.menu_book, title: "Duas", subtitle: "Daily supplications", route: '/duas'),
            _menuTile(context, icon: Icons.calendar_month, title: "Islamic Calendar", subtitle: "Hijri dates & Ramadan", route: '/calendar'),
            _menuTile(context, iconWidget: Image.asset('assets/tesbih.png', width: 26, height: 26), title: "Zikirmatik", subtitle: "Digital tasbih", route: '/zikr'),

            const SizedBox(height: 28),
            _sectionTitle("Support & Sharing"),

            // ⭐ SHARE APP BUTTON (Works with WhatsApp)
            _actionTile(
              context,
              icon: Icons.share_rounded,
              color: Colors.blueAccent,
              title: "Share with Friends",
              subtitle: "Send via WhatsApp or Social Media",
              onTap: () {
                Share.share(
                  'Check out this Salat Times app! It helps me stay on track with my prayers. 🕌 Download it here: https://apps.apple.com/us/app/sala-prayer-times/id6759267391',
                  subject: 'Prayer Times App',
                );
              },
            ),

            const SizedBox(height: 28),
            _sectionTitle("Information"),
            _menuTile(context, icon: Icons.info_outline, title: "About", subtitle: "App details & purpose", route: '/about'),

            const SizedBox(height: 30),
            // ⭐ TEST NOTIFICATION BUTTON (For your Samsung A16)
            // _actionTile(
            //   context,
            //   icon: Icons.notification_important,
            //   color: Colors.orangeAccent,
            //   title: "Test Notifications",
            //   subtitle: "Verifies alerts work in the background",
            //   onTap: () async {
            //     await NotificationService.testZonedNotification();
            //     if (!context.mounted) return;
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("Test set for 5 seconds. Lock your phone now!")),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white70, letterSpacing: 1),
      ),
    );
  }

  // Optimized Tile for standard Navigation
  Widget _menuTile(BuildContext context, {IconData? icon, Widget? iconWidget, required String title, required String subtitle, required String route}) {
    return _actionTile(
      context,
      icon: icon,
      iconWidget: iconWidget,
      title: title,
      subtitle: subtitle,
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(slidePageRoute(_getPage(route)));
      },
    );
  }

  // New flexible Tile for both Actions (Share/Test) and Navigation
  Widget _actionTile(BuildContext context, {IconData? icon, Widget? iconWidget, Color color = Colors.teal, required String title, required String subtitle, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08), // Fixed deprecation
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)), // Fixed deprecation
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        leading: Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.25), // Fixed deprecation
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: iconWidget ?? Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white70),
        onTap: onTap,
      ),
    );
  }
}