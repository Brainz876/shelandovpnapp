import 'package:flutter/material.dart';
import 'package:vpn_app/Components/BottomNavigationBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vpn_app/Screens/Auth/signin.dart';
import 'package:vpn_app/Screens/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vpn_app/Screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
          initialData: null,
        )
      ],
      child: MaterialApp(
        home: Authenticate(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => BottomNavBar()
        },
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return Home();
    }
    //The user isn't logged in and hence navigate to SignInPage.
    return SignIn();
  }
}
