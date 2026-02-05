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
  double? _qiblaBearing; // direction to Kaaba (0–360)
  double? _heading; // phone heading (0–360)

  StreamSubscription<CompassEvent>? _subscription;

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

      if (FlutterCompass.events == null) {
        setState(() {
          _loading = false;
          _error = "Compass not available on this device.";
        });
        return;
      }

      _subscription = FlutterCompass.events!.listen((event) {
        final heading = event.heading;
        if (heading == null || _qiblaBearing == null) return;

        final aligned = (_qiblaBearing! - heading).abs() < 3;

        if (aligned && !_hasVibrated) {
          _hasVibrated = true;
          HapticFeedback.mediumImpact(); // 🔔 vibration
        }

        if (!aligned) {
          _hasVibrated = false;
        }

        setState(() {
          _heading = heading;
          _loading = false;
        });
      });
    } catch (_) {
      setState(() {
        _loading = false;
        _error = "Unable to access location or compass.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bearing = _qiblaBearing;
    final heading = _heading;

    final isAligned = bearing != null &&
        heading != null &&
        (bearing - heading).abs() < 3;

    final rotationRad = (bearing != null && heading != null)
        ? ((bearing - heading) * pi / 180)
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Qibla Finder"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.black, Colors.grey.shade900]
                : [const Color(0xFFF5F7F8), const Color(0xFFE0F2F1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Align your phone towards the Qibla",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "🕋 Facing the Sacred Kaaba",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 28),

              // 🧭 Compass
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.teal.withOpacity(0.5),
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: rotationRad,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.arrow_drop_up,
                        size: 120,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "🕋",
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ),

              if (isAligned)
                const Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: Text(
                    "✔ You are facing the Qibla",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const SizedBox(height: 18),

              Text(
                "Qibla direction: ${bearing!.toStringAsFixed(1)}° from North",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                ),
              ),

              const SizedBox(height: 18),
              const Text(
                "If the direction seems inaccurate, move away from metal objects and gently rotate your phone in a figure-8.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
