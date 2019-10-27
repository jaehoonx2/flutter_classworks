import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'search.dart';
import 'favorite.dart';
import 'website.dart';
import 'mypage.dart';

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
        '/search': (BuildContext context) => SearchPage(),
        '/favorite': (BuildContext context) => FavoritePage(),
        '/website': (BuildContext context) => WebsitePage(),
        '/mypage': (BuildContext context) => MyPage(),
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