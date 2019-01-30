import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:running_app_practice/src/bloc/auth_bloc_provider.dart';
import 'package:running_app_practice/src/screen/running_screen.dart';

class MainScreen extends StatelessWidget {
  final authBloc = AuthBloc(FirebaseAuth.instance, GoogleSignIn.standard());
  List<Widget> _topTabs() {
    return <Widget>[
      Tab(text: "러닝 시작"),
      Tab(text: "챌린지 현황"),
    ];
  }
  List<Widget> _bottomTabs() {
    return <Widget>[
      Tab(text: "챌린지"),
      Tab(text: "나의 기록"),
      Tab(text: "러닝"),
      Tab(text: "응모함"),
      Tab(text: "마이페이지")
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sprint"),
        centerTitle: true,
        actions: <Widget>[
         IconButton(
          icon: Icon(Icons.shopping_cart),
           tooltip: 'Open shopping cart',
           onPressed: () {
            print("LOGOUT BUTTTTTTTT");
            authBloc.logout();
           },
         ),
       ],
      ),
      body: RunningScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // TODO: stream 으로 처리
        onTap: (int index) {
          // TODO: stream 을 변경해줘야할 듯
          print(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.red,
          )
        ]
      )
    );
  }
}