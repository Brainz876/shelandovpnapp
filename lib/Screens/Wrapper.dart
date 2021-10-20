import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/Auth/signin.dart';
import 'package:vpn_app/Screens/Auth/signup.dart';



class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
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