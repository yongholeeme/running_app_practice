import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../bloc/auth_bloc_provider.dart';

final List<String> photos = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class LoginScreen extends StatelessWidget {
  final authBloc = AuthBloc(FirebaseAuth.instance, GoogleSignIn.standard());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            imageSlider(),
            signInButtons(),
          ],
        )
      ),
    );
  }

  Widget imageSlider() {
    return new CarouselSlider(
      items: map<Widget>(photos, (index, i) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(i),
              fit: BoxFit.fill
            )
          ),
        );
      }),
      height: 400,
      autoPlay: false,
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      distortion: false
    );
  }

  Widget signInButtons() {
    return SignInButton(
      Buttons.Google,
      onPressed: () {
        authBloc.login();
      },
    );
  }
}