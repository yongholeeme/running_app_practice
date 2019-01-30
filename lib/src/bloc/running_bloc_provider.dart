import 'package:flutter/material.dart';
import 'running_bloc.dart';
export 'running_bloc.dart';

class RunningBlocProvider extends InheritedWidget{
  final RunningBloc runningBloc;

  RunningBlocProvider({Key key, Widget child, @required this.runningBloc}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static RunningBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(RunningBlocProvider) as RunningBlocProvider).runningBloc;
  }
}