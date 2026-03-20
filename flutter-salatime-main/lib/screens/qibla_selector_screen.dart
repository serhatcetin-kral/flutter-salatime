// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_compass/flutter_compass.dart';
//
// import '../services/location_service.dart';
// import '../services/qibla_service.dart';
//
// class QiblaCompassScreen extends StatefulWidget {
//   const QiblaCompassScreen({super.key});
//
//   @override
//   State<QiblaCompassScreen> createState() => _QiblaCompassScreenState();
// }
//
// class _QiblaCompassScreenState extends State<QiblaCompassScreen> {
//   double? _qiblaBearing;
//   double? _heading;
//
//   StreamSubscription<CompassEvent>? _subscription;
//
//   bool _loading = true;
//   String? _error;
//   bool _hasVibrated = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initQibla();
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
//
//   Future<void> _initQibla() async {
//     try {
//       final position = await LocationService.getUserLocation();
//
//       final bearing = QiblaService.bearingToKaaba(
//         userLat: position.latitude,
//         userLng: position.longitude,
//       );
//
//       _qiblaBearing = bearing;
//
//       _subscription = FlutterCompass.events?.listen((event) {
//         if (event.heading == null) return;
//
//         final heading = event.heading!;
//         final diff = (bearing - heading).abs();
//         final aligned = diff < 5;
//
//         if (aligned && !_hasVibrated) {
//           _hasVibrated = true;
//           HapticFeedback.mediumImpact();
//         }
//         if (!aligned) _hasVibrated = false;
//
//         setState(() {
//           _heading = heading;
//           _loading = false;
//         });
//       });
//     } catch (_) {
//       setState(() {
//         _loading = false;
//         _error = "Unable to access location or compass.";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bearing = _qiblaBearing;
//     final heading = _heading;
//
//     final kaabaAngle =
//     (bearing != null && heading != null)
//         ? (bearing - heading) * pi / 180
//         : 0.0;
//
//     final isAligned =
//         bearing != null &&
//             heading != null &&
//             (bearing - heading).abs() < 12;
//
//     // ⭐ RESPONSIVE SIZE ⭐
//     final double size =
//         MediaQuery.of(context).size.width * 0.7;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Qibla Finder"),
//         backgroundColor: Colors.teal,
//       ),
//
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF102027),
//               Color(0xFF1E3C45),
//               Color(0xFF2E5964),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//
//         // ⭐ SCROLLABLE FIX ⭐
//         child: SafeArea(
//           child: _loading
//               ? const Center(
//             child: CircularProgressIndicator(color: Colors.white),
//           )
//               : _error != null
//               ? Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 _error!,
//                 textAlign: TextAlign.center,
//                 style:
//                 const TextStyle(color: Colors.white),
//               ),
//             ),
//           )
//               : SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight:
//                 MediaQuery.of(context).size.height,
//               ),
//               child: Column(
//                 mainAxisAlignment:
//                 MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 20),
//
//                   const Text(
//                     "Align your phone towards the Qibla",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // 🧭 RESPONSIVE COMPASS
//                   Container(
//                     width: size,
//                     height: size,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color:
//                       Colors.black.withOpacity(0.25),
//                       border: Border.all(
//                         color: Colors.white
//                             .withOpacity(0.3),
//                         width: 2,
//                       ),
//                     ),
//                     child: Center(
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Icon(
//                             Icons.navigation,
//                             size: size * 0.3,
//                             color: isAligned
//                                 ? Colors.green
//                                 : Colors.teal,
//                           ),
//
//                           Transform.rotate(
//                             angle: kaabaAngle,
//                             child: Transform.translate(
//                               offset:
//                               Offset(0, -size / 2 + 30),
//                               child: Container(
//                                 width: size * 0.2,
//                                 height: size * 0.2,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.black,
//                                   border: Border.all(
//                                     color: Colors.white,
//                                     width: 2,
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   "🕋",
//                                   style:
//                                   TextStyle(fontSize: 28),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   if (isAligned)
//                     const Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text(
//                         "✔ You are facing the Qibla",
//                         style: TextStyle(
//                           color: Colors.greenAccent,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//
//                   const SizedBox(height: 20),
//
//                   if (bearing != null)
//                     Text(
//                       "Qibla direction: ${bearing.toStringAsFixed(1)}°",
//                       style: const TextStyle(
//                         color: Colors.white70,
//                       ),
//                     ),
//
//                   const Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Text(
//                       "Move away from metal objects and rotate your phone in a figure-8 for accuracy.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white60,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }