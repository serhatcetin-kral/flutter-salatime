import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1ABC9C),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image on top
            Image.asset(
              'assets/splash_logo.png',
              width: 120,
              height: 120,
            ),

            const SizedBox(height: 20),

            // Text
            const Text(
              'Accessing location…',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Location icon
            const Icon(Icons.location_on, size: 40, color: Colors.white),

            const SizedBox(height: 15),

            // Spinner under icon
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
