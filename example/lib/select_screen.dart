
import 'package:example/simple_google_map_screen.dart';
import 'package:flutter/material.dart';

import 'google_map_list_view_screen.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select test page'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CloneGoogleMapScreen();
              }));
              }, child: const Text('Clone Google Map screen'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const GoogleMapListViewScreen();
              }));
            }, child: const Text('Google Map List view screen'),
            ),
          ],
        ),
      ),
    );
  }
}
