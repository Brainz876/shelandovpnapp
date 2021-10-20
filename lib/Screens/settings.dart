import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/Auth/signin.dart';
import 'package:vpn_app/Screens/Services/auth.dart';
import 'package:vpn_app/Theme/theme.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  // const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
//

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: CustomTheme.primary)),
        title: Text(
          'Settings',
          style: TextStyle(color: CustomTheme.primary),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
                leading: Text('Save',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {}),
            ListTile(
                leading: Text('Change Password',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {}),
            ListTile(
                leading: Text('Help',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {}),
            ListTile(
                leading: Text('Sign Out',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                onTap: () {
                  context.read<AuthenticationProvider>().signOut().then(
                      (value) => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn())));
                }),
            // MaterialButton(
            //     child: Text('Support', style: TextStyle(color: Colors.white)),
            //     onPressed: () {}),
            // MaterialButton(
            //     child: Text('Report an issue',
            //         style: TextStyle(color: Colors.black, fontSize: 20)),
            //     onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
