import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('My Page'),
          onPressed: () {
            // Do Something
          },
        ),
      ),
    );
  }
}