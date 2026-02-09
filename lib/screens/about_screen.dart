import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title("Sala Prayer Time"),

                _card(
                  child: const Text(
                    "Sala Prayer Time is a simple and reliable Islamic app designed to help Muslims stay connected with their daily prayers and spiritual practices.",
                    style: _bodyText,
                  ),
                ),

                _sectionTitle("Key Features"),
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _bullet("Daily prayer times with notifications"),
                      _bullet("Next prayer countdown"),
                      _bullet("Hijri (Islamic) calendar"),
                      _bullet("Ramadan highlights & reminders"),
                      _bullet("Qibla direction finder"),
                      _bullet("Zikirmatik (digital tasbih)"),
                      _bullet("Offline prayer time support"),
                    ],
                  ),
                ),

                _sectionTitle("Islamic Calendar Notice"),
                _card(
                  child: const Text(
                    "Hijri dates in this app are calculated using an astronomical method and may vary slightly depending on local moon sighting and official announcements.",
                    style: _bodyText,
                  ),
                ),

                _sectionTitle("Privacy & Permissions"),
                _card(
                  child: const Text(
                    "This app uses location access only to calculate prayer times. No personal data is collected, stored, or shared. The app works fully offline after initial use.",
                    style: _bodyText,
                  ),
                ),

                const SizedBox(height: 24),

                Center(
                  child: Column(
                    children: const [
                      Text(
                        "Version 1.0.0",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "May Allah accept from us and from you 🤲",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------- UI HELPERS ----------

  static const TextStyle _bodyText = TextStyle(
    color: Colors.white70,
    fontSize: 14.5,
    height: 1.5,
  );

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: child,
    );
  }
}

// ---------- BULLET ----------
class _bullet extends StatelessWidget {
  final String text;
  const _bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(color: Colors.white70, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14.5,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
