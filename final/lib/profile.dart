import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _finish;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();

    _getUserInfo().then((finish) {
      setState(() {
        _finish = finish;
      });
    });
  }

  Future _getUserInfo() async => user = await _auth.currentUser();

  void _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if(_finish == null)
      return Text(
        'LOADING...',
        style: theme.textTheme.title,
      );
    else
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: () async {
              if (user == null) {
                print('No one has signed in.');
                return;
              }

              _signOut();
              print(user.uid + ' has successfully signed out.');

              // go to first
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShrineApp(),
                  )
              );
            },),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: user.photoUrl != null
                  ? Image.network(user.photoUrl, fit: BoxFit.fill)
                  : Image.network('http://handong.edu/site/handong/res/img/logo.png', fit: BoxFit.fill),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 40, 25, 10),
              child: Column(
                children: <Widget>[
                  Align(
                    child: Text(
                      '<Your UID>',
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.uid,
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 25,
              endIndent: 25,
              color: theme.primaryColor,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Column(
                children: <Widget>[
                  Align(
                    child: Text(
                      '<Your email>',
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      user.email != null ? user.email : 'anonymous',
                      style: TextStyle(
                        fontSize: 15,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}