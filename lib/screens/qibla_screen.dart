import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/widgets.dart';

import '../services/location_service.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen>
    with WidgetsBindingObserver {
  GoogleMapController? _mapController;

  LatLng? _userLocation;
  final LatLng _kaabaLocation = const LatLng(21.4225, 39.8262);

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // ⭐ important
    _loadQiblaMap();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // ⭐ Called when screen size / orientation changes
  @override
  void didChangeMetrics() {
    setState(() {});
  }

  Future<void> _loadQiblaMap() async {
    try {
      final position = await LocationService.getUserLocation();

      final userLatLng =
      LatLng(position.latitude, position.longitude);

      setState(() {
        _userLocation = userLatLng;

        _markers = {
          Marker(
            markerId: const MarkerId('user'),
            position: userLatLng,
            infoWindow: const InfoWindow(title: 'Your Location'),
          ),
          Marker(
            markerId: const MarkerId('kaaba'),
            position: _kaabaLocation,
            infoWindow: const InfoWindow(title: 'Kaaba'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure,
            ),
          ),
        };

        _polylines = {
          Polyline(
            polylineId: const PolylineId('qibla_line'),
            color: Colors.teal,
            width: 4,
            points: [userLatLng, _kaabaLocation],
          ),
        };

        loading = false;
      });
    } catch (e) {
      setState(() {
        error = "Unable to load Qibla map";
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qibla Finder"),
      ),

      // ⭐ FINAL SAFE BODY ⭐
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(child: Text(error!))
          : Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _userLocation!,
                zoom: 4,
              ),
              markers: _markers,
              polylines: _polylines,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                _mapController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
