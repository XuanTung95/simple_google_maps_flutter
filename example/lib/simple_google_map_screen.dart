

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:simple_google_maps_flutter/simple_google_maps_flutter.dart';
import 'package:simple_platform_view/simple_platform_view.dart';

class CloneGoogleMapScreen extends StatefulWidget {
  const CloneGoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<CloneGoogleMapScreen> createState() => _CloneGoogleMapScreenState();
}

class _CloneGoogleMapScreenState extends State<CloneGoogleMapScreen> {

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    /// Replace GoogleMapsFlutterPlatform.instance with the modified version
    if (Platform.isAndroid) {
      SimpleGoogleMapsFlutterAndroid.registerWith();
    }
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Google Map Screen $count"),
      ),
      body: Stack(
        children: [
          const Center(
            child: SizedBox.expand(
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
              ),
            ),
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Icon(Icons.abc),
            ),
          ),
        ],
      ),
    );
  }
}
