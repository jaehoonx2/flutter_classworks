import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        centerTitle : true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Search Page'),
          onPressed: () {
            // Do Something
          },
        ),
      ),
    );
  }
}