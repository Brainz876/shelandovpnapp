import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/premium.dart';
import 'package:vpn_app/Screens/settings.dart';
import 'package:vpn_app/Theme/theme.dart';

import 'package:vpn_app/core/models/dnsConfig.dart';
import 'package:vpn_app/core/models/vpnConfig.dart';
import 'package:vpn_app/core/utils/nizvpn_engine.dart';
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _vpnState = NizVpn.vpnDisconnected;
  List<VpnConfig> _listVpn = [];
  VpnConfig _selectedVpn;
  Color _color = Colors.grey.withOpacity(0.4);

  @override
  void initState() {
    super.initState();

    ///Add listener to update vpnstate
    NizVpn.vpnStageSnapshot().listen((event) {
      setState(() {
        _vpnState = event;
      });
    });

    ///Call initVpn
    initVpn();
  }

  ///Here you can start fill the listVpn, for this simple app, i'm using free vpn from https://www.vpngate.net/
  void initVpn() async {
    _listVpn.add(VpnConfig(
        config: await rootBundle.loadString("assets/vpn/us.ovpn"),
        name: "USA",
        username: "vpnbook",
        password: "e9s5w7s",
        flag: "icons/flags/png/us.png"));
    _listVpn.add(VpnConfig(
        config: await rootBundle.loadString("assets/vpn/fr.ovpn"),
        name: "France",
        username: "vpnbook",
        password: "e9s5w7s",
        flag: "icons/flags/png/fr.png"));
    _listVpn.add(VpnConfig(
        config: await rootBundle.loadString("assets/vpn/mx.ovpn"),
        name: "Mexico",
        username: "vpn",
        password: "vpn",
        flag: "icons/flags/png/mx.png"));
    if (mounted)
      setState(() {
        _selectedVpn = _listVpn.first;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("VPN App", style: TextStyle(color: CustomTheme.primary)),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
        iconTheme: IconThemeData(
          color: CustomTheme.primary,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
          child: Column(children: [
        UserAccountsDrawerHeader(
            accountName: Text("User1"),
            accountEmail: Text("user@gmail.com"),
            decoration: BoxDecoration(color: CustomTheme.primary),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40),
              ),
            )),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, int index) {
              return ListTile(
                  onTap: () {
                    if (_selectedVpn == _listVpn[index]) return;
                    print("${_listVpn[index].name} is selected");
                    // NizVpn.stopVpn;
                    setState(() {
                      _selectedVpn = _listVpn[index];
                    });
                  },
                  title: Text(_listVpn[index].name),
                  leading: Image.asset(_listVpn[index].flag,
                      package: 'country_icons', scale: 3));
            },
            itemCount: _listVpn.length)
      ])),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            _vpnState == NizVpn.vpnDisconnected
                ? "Connect VPN!"
                : _vpnState.replaceAll("_", " ").toUpperCase(),
            style: TextStyle(fontSize: 20, color: Color(0xFF00A6A6)),
          )),
          SizedBox(
            height: 40,
          ),
          Stack(alignment: Alignment.center, children: [
            ElevatedButton(
              child: Icon(
                Icons.power_settings_new,
                color: CustomTheme.primary,
                size: 50,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: _color,
                  shadowColor: Colors.red,
                  elevation: 0,
                  padding: EdgeInsets.all(100)),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Icon(
                Icons.power_settings_new,
                color: _color,
                size: 50,
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: _color,
                  shadowColor: Colors.red,
                  // shadowColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.all(70)),
              onPressed: () {},
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = _color == CustomTheme.primary.withOpacity(0.4)
                      ? Colors.grey.withOpacity(0.4)
                      : CustomTheme.primary.withOpacity(0.4);
                });
                _connectClick();
              },
              child: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 50,
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(40),
                shape: CircleBorder(),
                primary: _color,
                shadowColor: Colors.white,
                // side: BordxerSide(color: Colors.white)
              ),
            ),
          ]),
          SizedBox(
            height: 30,
          ),

          // Center(
          //     child: Text(
          //   'Internet now secured',
          //   style: TextStyle(fontSize: 20, color: Color(0xFF00A6A6)),
          // )),
          SizedBox(height: 60),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: 300,
            ),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Premium()));
                },
                style: ElevatedButton.styleFrom(primary: CustomTheme.primary),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Icon(Icons.star_border, color: Colors.yellow, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Go Premium',
                          ),
                          Text('Unlock High Speed Connection')
                        ]),
                  ]),
                )),
          ),
        ]),
      ),
    );
  }

  void _connectClick() {
    ///Stop right here if user not select a vpn
    if (_selectedVpn == null) return;

    if (_vpnState == NizVpn.vpnDisconnected) {
      ///Start if stage is disconnected
      NizVpn.startVpn(
        _selectedVpn,
        dns: DnsConfig("23.253.163.53", "198.101.242.72"),
      );
    } else {
      ///Stop if stage is "not" disconnected
      NizVpn.stopVpn();
    }
  }
}
