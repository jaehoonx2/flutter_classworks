import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

enum City { Seoul, Daegu, Busan }
City city = City.Seoul;

bool one = false;
bool two = false;
bool three = false;
bool four = false;
bool five = false;

DateTime _inDate = DateTime.now();
TimeOfDay _inTime = new TimeOfDay.now();

DateTime _outDate = DateTime.now();
TimeOfDay _outTime = new TimeOfDay.now();

final formatter = new DateFormat('yyyy.MM.dd (E)');

double hotelPrice = 0.0;

class Item {
  Item({
    this.headerValue,
    this.expandedWidget,
    this.isExpanded = false,
  });

  String headerValue;
  Widget expandedWidget;
  bool isExpanded;
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Item> _data = [
    Item(headerValue: "Select Location", expandedWidget: LocationWidget()),
    Item(headerValue: "Select hotel Classes", expandedWidget: ClassWidget()),
    Item(headerValue: "Select reservation date", expandedWidget: DateWidget()),
    Item(headerValue: "Fee", expandedWidget: FeeWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
            body: item.expandedWidget,
            isExpanded: item.isExpanded,
          );
        }).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: _buildPanel(),
            ),
            ListTile(
              title: RaisedButton(
                child: Text('Search'),
                color: theme.primaryColor,
                textColor: Colors.white,
                onPressed: () => _confirmDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            child: Text('Please check your choice :)', style: TextStyle(fontSize: 20)),
            margin: EdgeInsets.only(bottom: 30),
          ),
          content: SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                Icon(Icons.location_on, color: Colors.lightBlueAccent),
                                ],
                              ),
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(_LocationWidgetState().selectedCity),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 15),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Row(children: <Widget>[
                                Icon(Icons.star, color: Colors.yellow),
                              ],),
                              margin: EdgeInsets.only(right: 10),
                            ),
                            if(one == true)
                              Row(
                                children : [
                                  Row(
                                    children: List.generate(1, (index) {
                                      return Icon(index < 1 ? Icons.star : null, color: Colors.yellow, size: 15);
                                    }),
                                  ),
                                  Text("  "),
                                ],
                              ),
                            Container(
                              child: Row(),
                              margin: EdgeInsets.only(right: 4),
                            ),
                            if(two == true)
                              Row(
                                children : [
                                  Row(
                                    children: List.generate(2, (index) {
                                      return Icon(index < 2 ? Icons.star : null, color: Colors.yellow, size: 15);
                                    }),
                                  ),
                                  Text("  "),
                                ],
                              ),
                            Container(
                              child: Row(),
                              margin: EdgeInsets.only(right: 4),
                            ),
                            if(three == true)
                              Row(
                                children : [
                                  Row(
                                    children: List.generate(3, (index) {
                                      return Icon(index < 3 ? Icons.star : null, color: Colors.yellow, size: 15);
                                    }),
                                  ),
                                  Text("  "),
                                ],
                              ),
                            Container(
                              child: Row(),
                              margin: EdgeInsets.only(right: 4),
                            ),
                            if(four == true)
                              Row(
                                children : [
                                  Row(
                                    children: List.generate(4, (index) {
                                      return Icon(index < 4 ? Icons.star : null, color: Colors.yellow, size: 15);
                                    }),
                                  ),
                                  Text("  "),
                                ],
                              ),
                            Container(
                              child: Row(),
                              margin: EdgeInsets.only(right: 4),
                            ),
                            if(five == true)
                              Row(
                                children : [
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(index < 5 ? Icons.star : null, color: Colors.yellow, size: 15);
                                    }),
                                  ),
                                  Text("  "),
                                ],
                              ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 15),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Row(children: <Widget>[
                                Icon(Icons.date_range, color: Colors.lightBlueAccent),
                              ],),
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Container(
                              child: Column(
                                children: <Widget> [
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Row(children: <Widget>[
                                          Text("I    N", style: TextStyle(fontSize: 11)),
                                        ],),
                                        margin: EdgeInsets.only(right: 10),
                                      ),
                                      Container(
                                        child: Row(children: <Widget>[
                                          Text(_DateWidgetState().in_date, style: TextStyle(fontSize: 13)),
                                        ],),
                                        margin: EdgeInsets.only(right: 13),
                                      ),
                                      Text(_DateWidgetState().in_time, style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Row(children: <Widget>[
                                          Text("OUT", style: TextStyle(fontSize: 11)),
                                        ],),
                                        margin: EdgeInsets.only(right: 10),
                                      ),
                                      Container(
                                        child: Row(children: <Widget>[
                                          Text(_DateWidgetState().out_date, style: TextStyle(fontSize: 13)),
                                        ],),
                                        margin: EdgeInsets.only(right: 13),
                                      ),
                                      Text(_DateWidgetState().out_time, style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 15),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Row(children: <Widget>[
                                Icon(Icons.attach_money, color: Colors.grey),
                              ],),
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(_FeeWidgetState().hotelFee),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 15),
                      ),
                    ],
                  )
              )
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CONFIRM'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LocationWidget extends StatefulWidget {
  LocationWidget({Key key}) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  
  String selectedCity = city.toString().substring(5);

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('Seoul'),
            leading: Radio(
              value: City.Seoul,
              groupValue: city,
              onChanged: (City value) {
                setState(() {
                  city = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Daegu'),
            leading: Radio(
              value: City.Daegu,
              groupValue: city,
              onChanged: (City value) {
                setState(() {
                  city = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Busan'),
            leading: Radio(
              value: City.Busan,
              groupValue: city,
              onChanged: (City value) {
                setState(() {
                  city = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClassWidget extends StatefulWidget {
  @override
  _ClassWidgetState createState() => new _ClassWidgetState();
}

class _ClassWidgetState extends State<ClassWidget>{

  void _oneChanged(bool value) => setState(() => one = value);
  void _twoChanged(bool value) => setState(() => two = value);
  void _threeChanged(bool value) => setState(() => three = value);
  void _fourChanged(bool value) => setState(() => four = value);
  void _fiveChanged(bool value) => setState(() => five = value);

  @override
  Widget build(BuildContext context) {
    final starSize = 20.0;
    final starColor = Colors.yellow;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Checkbox(value: one, onChanged: _oneChanged),
            title: Row(
              children: List.generate(5, (index){
                return Icon(index < 1 ? Icons.star: null, color: starColor, size: starSize);
              }),
            ),
          ),
          ListTile(
            leading: Checkbox(value: two, onChanged: _twoChanged),
            title: Row(
              children: List.generate(5, (index){
                return Icon(index < 2 ? Icons.star: null, color: starColor, size: starSize);
              }),
            ),
          ),
          ListTile(
            leading: Checkbox(value: three, onChanged: _threeChanged),
            title: Row(
              children: List.generate(5, (index){
                return Icon(index < 3 ? Icons.star: null, color: starColor, size: starSize);
              }),
            ),
          ),
          ListTile(
            leading: Checkbox(value: four, onChanged: _fourChanged),
            title: Row(
              children: List.generate(5, (index){
                return Icon(index < 4 ? Icons.star: null, color: starColor, size: starSize);
              }),
            ),
          ),
          ListTile(
            leading: Checkbox(value: five, onChanged: _fiveChanged),
            title: Row(
              children: List.generate(5, (index){
                return Icon(index < 5 ? Icons.star: null, color: starColor, size: starSize);
              }),
            ),
          ),
        ],
      ),
    );
  }
}


class DateWidget extends StatefulWidget {
  DateWidget({Key key}) : super(key: key);
  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  String in_date = formatter.format(_inDate);
  String out_date = formatter.format(_outDate);

  String in_time = '$_inTime'.substring(10, 15);
  String out_time = '$_outTime'.substring(10, 15);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Column(
                children : [
                  Row(
                    children : [
                      Icon(Icons.date_range),
                      Text("check-in", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 2.0,),
                  Text(formatter.format(_inDate), style: TextStyle(fontSize: 10),),
                  SizedBox(height: 2.0,),
                  Text('$_inTime'.substring(10, 15), style: TextStyle(fontSize: 10),),
                ],
              ),
              SizedBox(width: 80),
              Column(
                children : [
                  SizedBox(height: 20.0, width: 150,
                      child : RaisedButton(
                        onPressed: () => _checkinDate(context),
                        child: Text('Select date'),
                        color: Colors.lightBlueAccent,
                      )),
                  SizedBox(height: 10),
                  SizedBox(height: 20.0, width: 150,
                      child : RaisedButton(
                        onPressed: () => _checkinTime(context),
                        child: Text('Select time'),
                        color: Colors.lightBlueAccent,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(height : 40),
          Row(
            children: [
              Column(
                children : [
                  Row(
                    children : [
                      Icon(Icons.date_range),
                      Text("check-out", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 2.0,),
                  Text(formatter.format(_outDate), style: TextStyle(fontSize: 10),),
                  SizedBox(height: 2.0,),
                  Text(('$_outTime'.substring(10, 15)), style: TextStyle(fontSize: 10),),
                ],
              ),
              SizedBox(width: 70),
              Column(
                children : [
                  SizedBox(height: 20.0, width: 150,
                      child : RaisedButton(
                        onPressed: () => _checkoutDate(context),
                        child: Text('Select date'),
                        color: Colors.lightBlueAccent,
                      )),
                  SizedBox(height: 10),
                  SizedBox(height: 20.0, width: 150,
                      child : RaisedButton(
                        onPressed: () => _checkoutTime(context),
                        child: Text('Select time'),
                        color: Colors.lightBlueAccent,
                      )),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Null> _checkinDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _inDate,
        firstDate: DateTime(2014, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != _inDate)
      setState(() {
        _inDate = picked;
      });
  }

  Future<Null> _checkoutDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _outDate,
        firstDate: DateTime(2014, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != _outDate)
      setState(() {
        _outDate = picked;
      });
  }

  Future<Null> _checkinTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _inTime
    );
    if (picked != null && picked != _inTime)
      setState(() {
        _inTime = picked;
      });
  }

  Future<Null> _checkoutTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _outTime
    );
    if (picked != null && picked != _outTime)
      setState(() {
        _outTime = picked;
      });
  }
}

class FeeWidget extends StatefulWidget {
  FeeWidget({Key key}) : super(key: key);

  @override
  _FeeWidgetState createState() => _FeeWidgetState();
}

class _FeeWidgetState extends State<FeeWidget> {
  void _setPrice(double value) => setState(() => hotelPrice = value);
  String hotelFee = '${(hotelPrice * 100).round()}';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: <Widget>[
          Text('\$ ${(hotelPrice * 100).round()}'),
          Slider(
            value: hotelPrice,
            onChanged: _setPrice,
          ),
        ],
      ),
    );
  }
}