import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/Auth/signin.dart';
import 'package:vpn_app/Screens/Auth/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
 
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn();
    } else {
      return SignUp(toggleView);
    }
  }
}
