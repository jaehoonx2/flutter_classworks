import 'package:flutter/material.dart';
import 'model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'detail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person,
            semanticLabel: 'profile',
          ),
          onPressed: () => Navigator.of(context).pushNamed('/profile'),
        ),
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              semanticLabel: 'add',
            ),
            onPressed: () => Navigator.of(context).pushNamed('/add'),
          ),
        ],
      ),
      body: _buildBody(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children: snapshot.map((data) => _buildGridCards(context, data)).toList(),
    );
  }

  Widget _buildGridCards(BuildContext context, DocumentSnapshot data) {
    final product = Product.fromSnapshot(data);
    final ThemeData theme = Theme.of(context);
    
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.network(
              product.imgURL,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: theme.textTheme.subtitle,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$ '+ product.price,
                    style: theme.textTheme.caption,
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text('more', style: TextStyle(color: theme.primaryColor, fontSize: 10.0),),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(product: product,),
                            )
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}