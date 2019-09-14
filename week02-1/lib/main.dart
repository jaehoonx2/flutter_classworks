import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        fontFamily: 'Montserrat',

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        body:  MySnackBarPage(
          title: appName,
        ),
      ),
    );
  }
}

class MySnackBarPage extends StatelessWidget {
  final String title;

  MySnackBarPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
          Theme.of(context).colorScheme.copyWith(secondary: Colors.green),
        ),
        child: FloatingActionButton(
          onPressed: (){
            final snackBar = SnackBar (
              content: Text('HonorCode!'),
              action: SnackBarAction(
                label: 'TabBarDemo',
                onPressed: (){
                  // TabsDemo page 이동
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext){
                        return TabBarDemo();
                      })
                  );

                  // 원래 자리로 복귀
                  //Navigator.pop(context);
                },
              ),
            ) ;
            // SnackBar 생성
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.school)),
                Tab(icon: Icon(Icons.computer)),
                Tab(icon: Icon(Icons.battery_charging_full)),
                Tab(icon: Icon(Icons.code)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Image.asset('images/HGU.png'),
              Image.asset('images/facebook.png'),
              Image.asset('images/youtube.png'),
              Image.asset('images/search.png'),
            ],
          ),
        ),
      ),
    );
  }
}