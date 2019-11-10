import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'edit.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Fluttertoast.showToast(
                  msg: "WRONG ACCESS : Only author can edit!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
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
                  Fluttertoast.showToast(
                      msg: "WRONG ACCESS : Only author can delete!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 15.0
                  );
                }
          }),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').where('docID', isEqualTo: product.docID).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final ThemeData theme = Theme.of(context);
    final product = Product.fromSnapshot(data);

    return SingleChildScrollView(
      key: ValueKey(product.name),
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
                  child: _buildVotes(context, data),
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
                  '\$ '+ product.price.toString(),
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
          SizedBox(height: 100,),
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Creator: ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      Text(
                        product.authorID,
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        product.created.toDate().toString(),
                        style: theme.textTheme.caption,
                      ),
                      Text(
                        ' Created',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        product.modified != null ? product.modified.toDate().toString() : '',
                        style: theme.textTheme.caption,
                      ),
                      Text(
                        product.modified != null ? ' Modified' : '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVotes(BuildContext context, DocumentSnapshot data) {
    final product = Product.fromSnapshot(data);

    return FittedBox(
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  color: Colors.red,
                  onPressed: () async {
                    bool alreadySaved = false;

                    final FirebaseUser currentUser = await _auth.currentUser();
                    String uuid = currentUser.uid;

                    for(int idx = 0; idx < product.clickedID.length; idx++) {
                      if(uuid == product.clickedID[idx]){
                        alreadySaved = true;
                        break;
                      }
                    }

                    if(alreadySaved == false) {   // 처음 누르는 거면
                      var list = List<dynamic>();
                      list.add(uuid);

                      product.reference.updateData({
                        'votes': FieldValue.increment(1),
                        'clickedID' : FieldValue.arrayUnion(list),
                      });

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('I LIKE IT!!!')));
                    } else {                      // 아니면
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('You can only do it once!!!')));
                    }
                  }),
              Text(product.votes.toString()),
            ],
          ),
        ],
      ),
    );
  }
}