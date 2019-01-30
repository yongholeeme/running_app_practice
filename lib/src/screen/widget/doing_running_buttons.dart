import 'package:flutter/material.dart';
import 'package:running_app_practice/src/bloc/bloc_provider.dart';

// Screen
import 'package:running_app_practice/src/screen/doing_running_screen.dart';

class DoingRunningButtons extends StatefulWidget {
  @override
  State createState() => DoingRunningButtonsState();
}
class DoingRunningButtonsState extends State<DoingRunningButtons> {
  @override
  Widget build(BuildContext context) {
    final _runningBloc = BlocProvider.ofRunningBloc(context);
    return Row(
      children: <Widget>[
        new RawMaterialButton(
          onPressed: () {
            print("!");
            _runningBloc.start();
          },
          child: new Icon(
            Icons.play_arrow,
            color: Colors.blue,
            size: 35.0,
          ),
          shape: new CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(15.0),
        ),
        new RawMaterialButton(
          onPressed: () {
            _runningBloc.pause();
          },
          child: new Icon(
            Icons.pause,
            color: Colors.blue,
            size: 35.0,
          ),
          shape: new CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(15.0),
        ),
        new RawMaterialButton(
          onPressed: () {
            _runningBloc.stop();
            Navigator.pop(context);
          },
          child: new Icon(
            Icons.stop,
            color: Colors.blue,
            size: 35.0,
          ),
          shape: new CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(15.0),
        )
      ],
    );
  }
}