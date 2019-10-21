import 'package:flutter/material.dart';
import 'model/hotel.dart';
import 'model/hotels_repository.dart';

class DetailPage extends StatelessWidget {
  List<Hotel> hotels = HotelsRepository().getAllHotelInfo();
  final int hotelIdx;

  DetailPage({Key key, @required this.hotelIdx}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.yellow[500], size: 20),
        Icon(Icons.star, color: Colors.yellow[500], size: 20),
        Icon(Icons.star, color: Colors.yellow[500], size: 20),
      ],
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stars,
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    hotels[hotelIdx].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.blue[500],
                      size: 15,
                    ),
                    Text(
                      '경북 포항시 한동로 558',
                      style: TextStyle(
                        color: Colors.blue[500],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.blue[500],
                      size: 15,
                    ),
                    Text(
                      '+82-54-260-1111',
                      style: TextStyle(
                        color: Colors.blue[500],
                        fontSize: 15
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        hotels[hotelIdx].desc,
        softWrap: true,
        style: TextStyle(
            color: Colors.blue[500],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(hotels[hotelIdx].name),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              Image.asset(
                'hotels/$hotelIdx-0.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              Divider(
                indent: 30,
                endIndent: 30,
                color: Colors.blue[500],
              ),
              textSection,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FavoriteWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
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
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red,
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}