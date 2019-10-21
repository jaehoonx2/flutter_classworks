import 'package:flutter/material.dart';

enum CityName { Seoul, Busan, Daegu }
CityName _character = CityName.Seoul;

/// This Widget is the main application widget.
class SearchPage extends StatelessWidget {
  static const String _title = 'Search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: MyStatefulWidget(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.idx,
    this.headerValue,
    this.isExpanded = false,
  });

  int idx;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    switch(index) {
      case 0 :
        return Item(
          idx: 0,
          headerValue: 'Location',
        );
        break;
      case 1 :
        return Item(
          idx: 1,
          headerValue: 'Class',
        );
        break;
      case 2 :
        return Item(
          idx: 2,
          headerValue: 'Date',
        );
        break;
      default :
        return Item(
          idx: 3,
          headerValue: 'Fee',
        );
    }
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(4);

  bool onev = false;
  bool twov = false;
  bool threev = false;
  bool fourv = false;
  bool fivev = false;

  double _value = 0.0;

  void _setvalue(double value) => setState(() => _value = value);

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Please check your choice!'),
            content: Text('Choooooooice!'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _buildPanel(),
            RaisedButton(
              child: Text('Search'),
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: _showMaterialDialog,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidget(int itemIdx) {


    List<Widget> widgets = [
      Center(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Busan'),
              leading: Radio(
                value: CityName.Busan,
                groupValue: _character,
                onChanged: (CityName value) {
                  setState((){
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Seoul'),
              leading: Radio(
                value: CityName.Seoul,
                groupValue: _character,
                onChanged: (CityName value) {
                  setState((){
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Daegu'),
              leading: Radio(
                value: CityName.Daegu,
                groupValue: _character,
                onChanged: (CityName value) {
                  setState((){
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                    value: onev,
                    onChanged: (bool value) {
                      setState((){
                        onev = !onev;
                      });
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: twov,
                    onChanged: (bool value) {
                      setState((){
                        twov = value;
                      });
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: threev,
                    onChanged: (bool value) {
                      setState((){
                        threev = value;
                      });
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: fourv,
                    onChanged: (bool value) {
                      setState((){
                        fourv = value;
                      });
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: fivev,
                    onChanged: (bool value) {
                      setState((){
                        fivev = value;
                      });
                    }),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                    Icon(Icons.star, color: Colors.yellow[500], size: 15),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Center(
        child:
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text('check-in'),
                      ],
                    ),
                    Text('0000-00-00\n(000) 00:00'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const RaisedButton(
                        child: const Text('Select date'),
                        onPressed: null),
                    const RaisedButton(
                        child: const Text('Select time'),
                        onPressed: null),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text('check-out'),
                      ],
                    ),
                    Text('0000-00-00\n(000) 00:00'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const RaisedButton(
                        child: const Text('Select date'),
                        onPressed: null),
                    const RaisedButton(
                        child: const Text('Select time'),
                        onPressed: null),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Center(
        child: Column(
          children: <Widget>[
            new Text('\$ ${(_value * 100).round()}'),
            new Slider(value: _value, onChanged: _setvalue)
          ],
        ),
      ),
    ];

    return widgets[itemIdx];
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: _buildWidget(item.idx),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}