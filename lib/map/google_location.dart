import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';

class GoogleLocation extends StatefulWidget {
  const GoogleLocation({super.key});

  @override
  State<GoogleLocation> createState() => _GoogleLocationState();
}

class _GoogleLocationState extends State<GoogleLocation> {

  late FlutterEarthGlobeController _controller;

  @override
  initState() {
    super.initState();
    _controller = FlutterEarthGlobeController(
        rotationSpeed: 0.05,
        isBackgroundFollowingSphereRotation: true,);

        // background: Image.asset('assets/2k_stars.jpg').image,
        // surface: Image.asset('assets/2k_earth-day.jpg').image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FlutterEarthGlobe(
            controller: _controller,
            radius: 120,
          )
      ),
    );
  }
}
