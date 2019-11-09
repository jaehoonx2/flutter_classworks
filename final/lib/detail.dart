import 'package:flutter/material.dart';
import 'model/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.create), onPressed: null),
          IconButton(icon: Icon(Icons.delete), onPressed: null),
        ],
      ),
      body: null,
    );
  }
}