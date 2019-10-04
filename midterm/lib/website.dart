import 'package:flutter/material.dart';

class WebSitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Site Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Web Site Page'),
          onPressed: () {
            // Do Something
          },
        ),
      ),
    );
  }
}