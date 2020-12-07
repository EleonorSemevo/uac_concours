import 'package:flutter/material.dart';
import 'package:uac_concours/constant/strings.dart';
import 'package:uac_concours/pages/register.dart';

import 'login.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleView: toggleView,title: title,);
    } else {
      return Register(toggleView: toggleView,title: title,);
    }
  }
}
