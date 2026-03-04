import 'package:flutter/material.dart';
import '../services/location_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Animation setup for a smooth entrance
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    _startApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startApp() async {
    try {
      // Start getting location while the splash is showing
      await LocationService.getUserLocation();
    } catch (_) {}

    // Fixed: Added the 2 seconds delay you preferred
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1ABC9C),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ⭐ MADE PICTURE BIGGER ⭐
              Image.asset(
                'assets/splash_logo.png',
                width: 220, // Increased from 120
                height: 220, // Increased from 120
                fit: BoxFit.contain,
                errorBuilder: (context, e, s) => const Icon(
                    Icons.mosque,
                    size: 150, // Made fallback icon bigger too
                    color: Colors.white
                ),
              ),

              const SizedBox(height: 40), // More breathing room

              const Text(
                'Accessing location…',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 30),

              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3, // Slightly thinner indicator looks cleaner
              ),
            ],
          ),
        ),
      ),
    );
  }
}