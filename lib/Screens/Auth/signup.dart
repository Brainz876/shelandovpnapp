import 'package:flutter/material.dart';
// import 'package:vpn_app/Screens/Auth/signin.dart';
import 'package:vpn_app/Screens/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  // const SignUp({Key? key}) : super(key: key);
  final Function toggleView;
  SignUp(this.toggleView);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  Future signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('VPN App',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Sign Up',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                  controller: emailEditingController,
                  decoration: InputDecoration(labelText: 'Email')),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordEditingController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Color(0xFF00A6A6),
                  focusColor: Color(0xFF00A6A6),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Re-Enter Password',
                  fillColor: Color(0xFF00A6A6),
                  focusColor: Color(0xFF00A6A6),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                  onPressed: () {
                    signUp();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      minimumSize: Size(double.infinity, 30),
                      primary: Color(0xFF00A6A6)),
                  child: Text('Sign Up', style: TextStyle(fontSize: 18))),
              TextButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text(
                  'Already have an account? Sign In',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
