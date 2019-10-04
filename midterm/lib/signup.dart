import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyCustomForm(),
      );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Username';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Confirm Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Confirm Password';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Email Address',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Email Address';
              }
              return null;
            },
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                child: Text('SIGN UP'),
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}