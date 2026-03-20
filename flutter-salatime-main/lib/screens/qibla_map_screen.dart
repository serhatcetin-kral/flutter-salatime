// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart' as latlng;
//
// import '../services/location_service.dart';
//
// class QiblaMapScreen extends StatefulWidget {
//   const QiblaMapScreen({super.key});
//
//   @override
//   State<QiblaMapScreen> createState() => _QiblaMapScreenState();
// }
//
// class _QiblaMapScreenState extends State<QiblaMapScreen> {
//   latlng.LatLng? _userLocation;
//
//   final latlng.LatLng _kaaba =
//   const latlng.LatLng(21.4225, 39.8262);
//
//   bool loading = true;
//   String? error;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLocation();
//   }
//
//   Future<void> _loadLocation() async {
//     try {
//       final pos = await LocationService.getUserLocation();
//
//       setState(() {
//         _userLocation =
//             latlng.LatLng(pos.latitude, pos.longitude);
//         loading = false;
//       });
//     } catch (_) {
//       setState(() {
//         error = "Location required for Qibla map";
//         loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (loading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     if (error != null) {
//       return Scaffold(
//         body: Center(child: Text(error!)),
//       );
//     }
//
//     final user = _userLocation!;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Qibla Map"),
//         backgroundColor: Colors.teal,
//       ),
//
//       body: SizedBox.expand(
//         child: FlutterMap(
//           options: MapOptions(
//             initialCenter: latlng.LatLng(
//               (user.latitude + _kaaba.latitude) / 2,
//               (user.longitude + _kaaba.longitude) / 2,
//             ), // ⭐ center between user & Kaaba
//             initialZoom: 3.5,
//           ),
//           children: [
//             TileLayer(
//               urlTemplate:
//               "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
//               userAgentPackageName:
//               'com.example.salahPrayerTime',
//             ),
//
//             // ⭐ LINE SHOWS QIBLA DIRECTION
//             PolylineLayer(
//               polylines: [
//                 Polyline(
//                   points: [user, _kaaba],
//                   strokeWidth: 5,
//                   color: Colors.red,
//                 ),
//               ],
//             ),
//
//             MarkerLayer(
//               markers: [
//                 Marker(
//                   point: user,
//                   width: 60,
//                   height: 60,
//                   child: const Icon(
//                     Icons.person_pin_circle,
//                     color: Colors.blue,
//                     size: 50,
//                   ),
//                 ),
//                 Marker(
//                   point: _kaaba,
//                   width: 60,
//                   height: 60,
//                   child: const Text(
//                     "🕋",
//                     style: TextStyle(fontSize: 40),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//       bottomNavigationBar: const Padding(
//         padding: EdgeInsets.all(12),
//         child: Text(
//           "Face toward the red line to face the Qibla.",
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
