

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

  int count = 0;
  GoogleMapController? controller;

  @override
  void initState() {
    super.initState();
    /// Replace GoogleMapsFlutterPlatform.instance with the modified version
    if (Platform.isAndroid) {
      SimpleGoogleMapsFlutterAndroid.registerWith();
    } else if (Platform.isIOS) {
      SimpleGoogleMapsFlutterIOS.registerWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Google Map Screen $count"),
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox.expand(
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  print("onMapCreated mapId: ${controller.mapId}");
                  this.controller = controller;
                }
              ),
            ),
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
                controller?.moveCamera(CameraUpdate.newLatLng(const LatLng(20.988394, -156.663843)));
              },
              child: const Icon(Icons.abc),
            ),
          ),
        ],
      ),
    );
  }
}
