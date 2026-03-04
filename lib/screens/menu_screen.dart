import 'package:flutter/material.dart';
import 'package:salah_prayer_time/screens/qibla_map_screen.dart';
import 'package:salah_prayer_time/screens/qibla_selector_screen.dart';
import '../utils/page_transition.dart';
import '../screens/about_screen.dart';
import '../screens/zikr_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/qibla_compass_screen.dart';
import '../screens/about_screen.dart';
import 'dua_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  Widget _getPage(String route) {
    switch (route) {
      case '/zikr':
        return const ZikrScreen();
      case '/calendar':
        return const CalendarScreen();
      case '/qibla':
        return const QiblaCompassScreen();
      case '/about':
        return const AboutScreen();
      case '/duas':
        return const DuaScreen();
      default:
        return const SizedBox();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF102027),
              Color(0xFF1E3C45),
              Color(0xFF2E5964),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          children: [
            _sectionTitle("Tools"),

            _menuTile(
              context,
              icon: Icons.explore,
              title: "Qibla Finder",
              subtitle: "Direction of the Kaaba",
              route: '/qibla',
            ),
            _menuTile(
              context,
              icon: Icons.menu_book,
              title: "Duas",
              subtitle: "Daily supplications",
              route: '/duas',
            ),


            _menuTile(
              context,
              icon: Icons.calendar_month,
              title: "Islamic Calendar",
              subtitle: "Hijri dates & Ramadan",
              route: '/calendar',
            ),

            // 🔹 ZIKIRMATIK (uses image)
          _menuTile(
            context,
            iconWidget: Image.asset(
              'assets/tesbih.png',
              width: 26,
              height: 26,
              // color: Colors.white,
            ),
            title: "Zikirmatik",
            subtitle: "Digital tasbih",
            route: '/zikr',
          ),



            const SizedBox(height: 28),
            _sectionTitle("Information"),

            _menuTile(
              context,
              icon: Icons.info_outline,
              title: "About",
              subtitle: "App details & purpose",
              route: '/about',
            ),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
          letterSpacing: 1,
        ),
      ),
    );
  }

  // MENU TILE (supports icon OR image)
  Widget _menuTile(
      BuildContext context, {
        IconData? icon,
        Widget? iconWidget,
        required String title,
        required String subtitle,
        required String route,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
      ),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.25),
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: iconWidget ??
              Icon(
                icon,
                color: Colors.white,
              ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
        trailing:
        const Icon(Icons.chevron_right, color: Colors.white70),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            slidePageRoute(_getPage(route)),
          );
        },


      ),
    );
  }
}
