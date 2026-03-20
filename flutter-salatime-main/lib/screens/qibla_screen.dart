import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';



import '../services/location_service.dart';



class QiblaScreen extends StatefulWidget {

  const QiblaScreen({super.key});



  @override

  State<QiblaScreen> createState() => _QiblaScreenState();

}



class _QiblaScreenState extends State<QiblaScreen> with WidgetsBindingObserver {

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

    WidgetsBinding.instance.addObserver(this);

    _loadQiblaMap();

  }



  @override

  void dispose() {

    WidgetsBinding.instance.removeObserver(this);

    _mapController?.dispose();

    super.dispose();

  }



  @override

  void didChangeMetrics() {

    if (mounted) setState(() {});

  }



  Future<void> _loadQiblaMap() async {

    try {

      final position = await LocationService.getUserLocation();

      final userLatLng = LatLng(position.latitude, position.longitude);



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

        error = null;

      });



      if (_mapController != null) {

        await _mapController!.animateCamera(

          CameraUpdate.newLatLngZoom(userLatLng, 5),

        );

      }

    } catch (_) {

      setState(() {

        error = "Unable to load Qibla map (location permission required).";

        loading = false;

      });

    }

  }



  @override

  Widget build(BuildContext context) {

    final userLoc = _userLocation;



    return Scaffold(

      appBar: AppBar(

        title: const Text("Qibla Finder"),

      ),



// ⭐ FULL SCREEN FIX FOR ANDROID

      body: loading

          ? const Center(child: CircularProgressIndicator())

          : error != null

          ? Center(child: Text(error!))

          : (userLoc == null)

          ? const Center(child: Text("Location not available"))

          : SizedBox.expand(

        child: GoogleMap(

          initialCameraPosition: CameraPosition(

            target: userLoc,

            zoom: 5,

          ),

          markers: _markers,

          polylines: _polylines,

          myLocationEnabled: true,

          myLocationButtonEnabled: false,

          zoomControlsEnabled: false,

          onMapCreated: (controller) async {

            _mapController = controller;

            await controller.animateCamera(

              CameraUpdate.newLatLngZoom(userLoc, 5),

            );

          },

        ),

      ),

    );

  }

}