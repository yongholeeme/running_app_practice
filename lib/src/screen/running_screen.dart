import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../screen/widget/map_flutter.dart';

class RunningScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MapFlutter(),
        // SignInButton(
        //   Buttons.Google,
        //   onPressed: () {
        //     // authBloc.login();
        //   },
        // ),
      ],
    );
  }
}