import 'package:flutter/material.dart';

class FavoriteHotelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Hotels Page'),
        centerTitle : true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Favorite Hotels Page'),
          onPressed: () {
            // Do Something
          },
        ),
      ),
    );
  }
}