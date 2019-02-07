import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../bloc/bloc_provider.dart';
// Screen
import '../doing_running_screen.dart';

class MapFlutter extends StatefulWidget {
  @override
  State createState() => MapFlutterState();
}
class MapFlutterState extends State<MapFlutter> {
  GoogleMapController mapController;
  Position position;
  Position position1;
  Position position2;


  @override
  Widget build(BuildContext context) {
    final _runningBloc = BlocProvider.ofRunningBloc(context);
    var con;
    return Stack(
      children: <Widget>[
        Container(
          child:GoogleMap(
            options: GoogleMapOptions(
              trackCameraPosition: true,
              myLocationEnabled: true,
              cameraPosition: const CameraPosition(target: LatLng(51.5160895, -0.1294527)),
            ),
            // onMapCreated: _onMapCreated,
            onMapCreated: (controller) {
              mapController = controller;
              con = controller;
              mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  // bearing: 270.0,
                  target: LatLng(51.5160895, -0.1294527),
                  // target: LatLng(snapshot.data.latitude, snapshot.data.longitude),
                  // tilt: 30.0,
                  zoom: 17.0,
                ),
              ));
            },
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
              _runningBloc.start();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoingRunningScreen()),
              );
            },
          ),
        )
      ],
    );
  }
}