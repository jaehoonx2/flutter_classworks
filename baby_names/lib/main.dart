import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Name Votes')),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add a baby name"),
                content: TextField(controller: myController),
                actions: <Widget>[
                  FlatButton(
                    child: Text('ADD'),
                    onPressed: () {
                      if (myController.text.isNotEmpty) {
                        Firestore.instance.collection('baby').document().setData({'name': myController.text, 'votes': 0, 'dislikes':0 });
                        myController.clear();
                        Navigator.of(context).pop();
                      } else {
                        Fluttertoast.showToast(
                            msg: "PLEASE ENTER THE BABY NAME!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('baby').snapshots(),
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
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: IconButton(icon: Icon(Icons.delete), onPressed: () => Firestore.instance.collection('baby').document(data.documentID).delete()),
          title: Text(record.name),
          trailing: _buildVotes(context, data),
        ),
      ),
    );
  }

  Widget _buildVotes(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return FittedBox(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.thumb_up), onPressed: () => record.reference.updateData({'votes': FieldValue.increment(1)})),
              Text(record.votes.toString()),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.thumb_down), onPressed: () => record.reference.updateData({'dislikes': FieldValue.increment(1)})),
              Text(record.dislikes.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final int dislikes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        assert(map['dislikes'] != null),
        name = map['name'],
        votes = map['votes'],
        dislikes = map['dislikes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes:$dislikes>";
}