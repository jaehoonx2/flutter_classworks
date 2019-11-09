import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'profile.dart';
import 'add.dart';

class ShrineApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/profile': (BuildContext context) => ProfilePage(),
        '/add': (BuildContext context) => AddPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}