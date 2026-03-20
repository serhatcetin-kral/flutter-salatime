import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

import '../services/location_service.dart';
import '../services/qibla_service.dart';

class QiblaCompassScreen extends StatefulWidget {
  const QiblaCompassScreen({super.key});

  @override
  State<QiblaCompassScreen> createState() => _QiblaCompassScreenState();
}

class _QiblaCompassScreenState extends State<QiblaCompassScreen> {
  double? _qiblaBearing;
  double? _heading;

  StreamSubscription<CompassEvent>? _subscription;
  Timer? _timeoutTimer; // ⭐ To detect if sensor is missing (like iOS Simulator)

  bool _loading = true;
  String? _error;
  bool _hasVibrated = false;

  @override
  void initState() {
    super.initState();
    _initQibla();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _timeoutTimer?.cancel();
    super.dispose();
  }

  Future<void> _initQibla() async {
    try {
      final position = await LocationService.getUserLocation();

      final bearing = QiblaService.bearingToKaaba(
        userLat: position.latitude,
        userLng: position.longitude,
      );

      setState(() {
        _qiblaBearing = bearing;
      });

      // ⭐ Start a timer to check if the compass sensor actually sends data
      _timeoutTimer = Timer(const Duration(seconds: 5), () {
        if (mounted && _heading == null && _error == null) {
          setState(() {
            _loading = false;
            _error = "Compass sensor not detected.\n(Note: iOS Simulators do not support compass hardware)";
          });
        }
      });

      _subscription = FlutterCompass.events?.listen((event) {
        if (event.heading == null) return;

        final heading = event.heading!;
        final diff = (bearing - heading).abs();
        final aligned = diff < 5;

        if (aligned && !_hasVibrated) {
          _hasVibrated = true;
          HapticFeedback.mediumImpact();
        }
        if (!aligned) _hasVibrated = false;

        if (mounted) {
          setState(() {
            _heading = heading;
            _loading = false;
            _timeoutTimer?.cancel(); // Received data, cancel the timeout
          });
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = "Unable to access location or compass.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bearing = _qiblaBearing;
    final heading = _heading;

    // Calculate the rotation angle
    final kaabaAngle = (bearing != null && heading != null)
        ? (bearing - heading) * pi / 180
        : 0.0;

    final isAligned = bearing != null && heading != null && (bearing - heading).abs() < 12;

    final double size = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Qibla Finder", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF102027), Color(0xFF1E3C45), Color(0xFF2E5964)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: _loading
              ? const Center(child: CircularProgressIndicator(color: Colors.white))
              : _error != null
              ? Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
              : SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Align your phone towards the Qibla",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 40),

                // 🧭 THE COMPASS STACK
                Center(
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.25),
                      border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // The static navigation icon (represents the phone)
                        Icon(
                          Icons.navigation,
                          size: size * 0.3,
                          color: isAligned ? Colors.greenAccent : Colors.tealAccent,
                        ),

                        // The rotating Kaaba pointer
                        AnimatedRotation(
                          turns: (kaabaAngle / (2 * pi)),
                          duration: const Duration(milliseconds: 200),
                          child: Transform.translate(
                            offset: Offset(0, -size / 2 + 30),
                            child: Container(
                              width: size * 0.2,
                              height: size * 0.2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              alignment: Alignment.center,
                              child: const Text("🕋", style: TextStyle(fontSize: 28)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                if (isAligned)
                  const Text(
                    "✔ You are facing the Qibla",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                const SizedBox(height: 20),
                if (bearing != null)
                  Text(
                    "Qibla direction: ${bearing.toStringAsFixed(1)}°",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Text(
                    "Move away from metal objects and rotate your phone in a figure-8 for accuracy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}