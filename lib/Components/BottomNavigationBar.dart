import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/home.dart';
import 'package:vpn_app/Screens/premium.dart';
// import 'package:vpn_app/Screens/mainScreen.dart';
// import 'package:vpn_app/Screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  // const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> _pages = <Widget>[
    Home(),
    // MainScreen(),
    Premium(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF00A6A6),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings')
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
