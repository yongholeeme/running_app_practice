import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'auth_bloc.dart';
// import 'user_bloc.dart';
export 'auth_bloc.dart';
// export 'user_bloc.dart';

class AuthBlocProvider extends InheritedWidget {
  final AuthBloc authBloc;

  AuthBlocProvider({Key key, Widget child,
    @required this.authBloc})
    : super(child: child, key: key) {

    // authBloc.activeUser.pipe(userBloc.setActiveUser);
  }

  static AuthBlocProvider of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AuthBlocProvider) as AuthBlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}