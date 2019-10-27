import 'package:flutter/material.dart';
import 'model/product.dart';
import 'photohero.dart';

final List<Product> _saved = List<Product>();

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.topLeft,
              child: Stack(
                children: <Widget>[
                  PhotoHero(
                    photo: product.assetName,
                    width: double.infinity,
                    onTap: null,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FavoriteWidget(product: product),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.0),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Icon(
                    index < product.stars ? Icons.star : null,
                    color: Colors.yellow,
                  );
                }),
              ),
            ),
            SizedBox(height: 3.0),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 20,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 3.0),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  ListTile(
//                    leading: Icon(Icons.location_on, color: theme.primaryColor,),
//                    title: Text(
//                        product.address,
//                      style: TextStyle(
//                        fontSize: 14,
//                        color: theme.primaryColor,
//                      ),
//                    ),
//                    dense: true,
//                    onTap: null,
//                    enabled: false,
//                  ),
                  Text(
                    product.address,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.primaryColor,
                    ),
                  ),
                  Text(
                    product.phone,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: theme.primaryColor,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {

  final Product product;

  FavoriteWidget({Key key, @required this.product}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  @override
  Widget build(BuildContext context) {
    bool alreadySaved = _saved.contains(widget.product);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (alreadySaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red,
            onPressed: (){
              setState(() {
                if (alreadySaved) {
                  _saved.remove(widget.product);
                } else {
                  _saved.add(widget.product);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}