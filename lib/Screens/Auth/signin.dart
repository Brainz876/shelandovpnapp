import 'package:flutter/material.dart';
import 'package:vpn_app/Components/BottomNavigationBar.dart';
import 'package:vpn_app/Screens/Services/auth.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool signUp = true;

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
                child: Text('Login',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email')),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (val) {
                      return val.length > 6
                          ? null
                          : "Enter Password 6+ characters";
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      fillColor: Color(0xFF00A6A6),
                      focusColor: Color(0xFF00A6A6),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<AuthenticationProvider>()
                        .signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        )
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar())));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      minimumSize: Size(double.infinity, 30),
                      primary: Color(0xFF00A6A6)),
                  child: Text('Login', style: TextStyle(fontSize: 18))),
              TextButton(
                onPressed: () {
                  // widget.toggleView();
                },
                child: Text(
                  'Don’t have an account? Sign Up',
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
