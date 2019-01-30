import 'package:flutter/material.dart';
import 'package:running_app_practice/src/bloc/bloc_provider.dart';
import 'package:running_app_practice/src/screen/widget/doing_running_buttons.dart';
import '../bloc/running_bloc_provider.dart';

class DoingRunningScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _runningBloc = BlocProvider.ofRunningBloc(context);
    return Column(
        children: <Widget>[
          duration(_runningBloc),
          Text("Duration"),
          distance(_runningBloc),
          Text("Distance"),
          average(_runningBloc),
          Text("Average Time"),
          DoingRunningButtons(),
        ],
      );
  }

  Widget duration(_runningBloc) {
    return StreamBuilder(
      stream: _runningBloc.duration,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return snapshot.hasData ? Text(snapshot.data) : Text("00:00");
        // return Text("trash value");
      });
  }
  Widget distance(_runningBloc) {
    return StreamBuilder(
      stream: _runningBloc.distance,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return snapshot.hasData ? Text(snapshot.data) : Text("0");
      });
  }
  Widget average(_runningBloc) {
    return StreamBuilder(
      stream: _runningBloc.average,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return snapshot.hasData ? Text(snapshot.data) : Text("0'00''");
      });
  }
}