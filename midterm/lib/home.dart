import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final kTextBoxHeight = 65.0;

  List<Card> _buildGridCards(BuildContext context) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.yellow[500], size: 15),
        Icon(Icons.star, color: Colors.yellow[500], size: 15),
        Icon(Icons.star, color: Colors.yellow[500], size: 15),
      ],
    );

    List<Card> hotels = [
      new Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                'hotels/0-0.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stars,
                    Text(
                      '비전관',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[500],
                          size: 15,
                        ),
                        Text(
                          '경북 포항시 한동로 558',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: null,
                          child: Text(
                              'More',
                              style: TextStyle(
                                color: Colors.blue[500],
                                fontSize: 10,
                              ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      new Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                'hotels/1-0.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stars,
                    Text(
                      '창조관',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[500],
                          size: 15,
                        ),
                        Text(
                          '경북 포항시 한동로 558',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'More',
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 10,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      new Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                'hotels/2-0.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stars,
                    Text(
                      '벧엘관',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[500],
                          size: 15,
                        ),
                        Text(
                          '경북 포항시 한동로 558',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'More',
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 10,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      new Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                'hotels/3-0.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stars,
                    Text(
                      '로뎀관',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[500],
                          size: 15,
                        ),
                        Text(
                          '경북 포항시 한동로 558',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'More',
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 10,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      new Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                'hotels/4-0.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stars,
                    Text(
                      '국제관',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[500],
                          size: 15,
                        ),
                        Text(
                          '경북 포항시 한동로 558',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'More',
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 10,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      new Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                'hotels/5-0.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stars,
                    Text(
                      '은혜관',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[500],
                          size: 15,
                        ),
                        Text(
                          '경북 포항시 한동로 558',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'More',
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 10,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return hotels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle : true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              semanticLabel: 'website',
            ),
            onPressed: () {
              print('Website button');
              Navigator.pushNamed(context, '/website');
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            padding: EdgeInsets.all(8.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
              child: Text(
                'Pages',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                Navigator.pushNamed(context, '/search');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Favorite Hotel'),
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Website'),
              onTap: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/website');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Page'),
              onTap: () {
                Navigator.pushNamed(context, '/mypage');
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
