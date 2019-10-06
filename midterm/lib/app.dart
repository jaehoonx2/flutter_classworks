import 'package:flutter/material.dart';

import 'login.dart';
import 'home.dart';
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
      routes: {
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/favorite': (context) => FavoriteHotelsPage(),
        '/website': (context) => WebViewExample(),
        '/mypage': (context) => MyPage(),
      },
      onGenerateRoute: _getRoute,
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