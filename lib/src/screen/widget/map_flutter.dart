import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Screen
import 'package:running_app_practice/src/screen/doing_running_screen.dart';

class MapFlutter extends StatefulWidget {
  @override
  State createState() => MapFlutterState();
}
class MapFlutterState extends State<MapFlutter> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child:GoogleMap(
            onMapCreated: _onMapCreated,
          ),
        ),
        Positioned(
          bottom: 50.0,
          left: 50.0,
          right: 50.0,
          child: RaisedButton(
            child: const Text('Running Start'),
            onPressed: () {
              // TODO: Navigate to Running Start Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoingRunningScreen()),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        const CameraPosition(
          bearing: 270.0,
          target: LatLng(51.5160895, -0.1294527),
          tilt: 30.0,
          zoom: 17.0,
        ),
      ));
    });
  }
}