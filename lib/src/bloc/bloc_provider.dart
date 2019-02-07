import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'auth_bloc.dart';
import 'running_bloc.dart';
// import 'user_bloc.dart';
export 'auth_bloc.dart';
export 'running_bloc.dart';
// export 'user_bloc.dart';

class BlocProvider extends InheritedWidget {
  final AuthBloc authBloc;
  final RunningBloc runningBloc;

  BlocProvider({Key key, Widget child,
    @required this.authBloc, @required this.runningBloc})
    : super(child: child, key: key) {

    // authBloc.activeUser.pipe(userBloc.setActiveUser);
  }

  static AuthBloc ofAuthBloc(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).authBloc;

  static RunningBloc ofRunningBloc(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).runningBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}