import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/product.dart';
import 'edit.dart';

final List<Product> saved = List<Product>();
final FirebaseAuth _auth = FirebaseAuth.instance;

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.create), onPressed: () async {
            final FirebaseUser currentUser = await _auth.currentUser();
            if(currentUser.uid == product.authorID) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPage(product: product,),
                  )
              );
            } else {
              print('Wrong Acess!');
            }
          }),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final FirebaseUser currentUser = await _auth.currentUser();
                if(currentUser.uid == product.authorID) {
                  await Firestore.instance.collection('products').document(product.docID).delete();
                  Navigator.pop(context);
                } else {
                  print('Wrong Acess!');
                }
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.network(
                product.imgURL,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 3.0),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Align(
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 30,
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Align(
                    child: FavoriteWidget(),
                    alignment: Alignment.centerRight,
                  ),

                ],
              ),
            ),
            SizedBox(height: 3.0),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '\$ '+ product.price,
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              color: theme.primaryColor,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 15,
                  color: theme.primaryColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Creator: ' + product.authorID,
                      style: theme.textTheme.caption,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.created.toDate().toString() + ' Created',
                      style: theme.textTheme.caption,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.modified != null ? product.modified.toDate().toString() + ' Modified' : '',
                      style: theme.textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  String num = '0';

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        num = '0';
      } else {
        _isFavorited = true;
        num = '1';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: Icon(Icons.thumb_up),
            color: Colors.red,
            onPressed: _toggleFavorite,
          ),
        ),
        Text(num),
      ],
    );
  }
}