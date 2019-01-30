import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bloc/bloc_provider.dart';
// import 'package:running_app_practice/src/bloc/auth_bloc_provider.dart';
// import 'package:running_app_practice/src/bloc/running_bloc_provider.dart';
import 'package:running_app_practice/src/screen/main_screen.dart';
import 'package:running_app_practice/src/screen/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authBloc = AuthBloc(FirebaseAuth.instance, GoogleSignIn.standard());
    final _runningBLoc = RunningBloc();

    return BlocProvider(
      authBloc: _authBloc,
      runningBloc: _runningBLoc,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
            body: StreamBuilder(
                stream: _authBloc.activeUser,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("기다리는중...");
                  } else {
                    if (snapshot.hasData) {
                      return MainScreen();
                    }
                    return LoginScreen();
                  }
                })),
      ),
    );
  }
}
