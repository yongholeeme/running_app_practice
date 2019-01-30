import 'package:flutter/material.dart';

class DoingRunningScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("12:34"),
            Text("Duration"),
            Text("2.34"),
            Text("Distance"),
            Text("5'17''"),
            Text("Average Time"),
            Row(
              children: <Widget>[
                new RawMaterialButton(
                  onPressed: () {},
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
                  onPressed: () {},
                  child: new Icon(
                    Icons.pause,
                    color: Colors.blue,
                    size: 35.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}