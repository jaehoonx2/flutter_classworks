import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

import 'detail.dart';
import 'photohero.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
//    final NumberFormat formatter = NumberFormat.simpleCurrency(
//        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: PhotoHero(
                photo: product.assetName,
                width: double.infinity,
                onTap: null,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Icon(
                            index < product.stars ? Icons.star : null,
                            color: Colors.yellow,
                            size: 10.0,
                        );
                      }),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      product.name,
                      style: theme.textTheme.subtitle,
                      maxLines: 1,
                    ),
                    SizedBox(height: 3.0),
                    Text(
//                      formatter.format(product.stars),
                      product.address,
                      style: theme.textTheme.caption,
                      maxLines: 2,
                    ),
                    SizedBox(height: 3.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Text('more', style: TextStyle(color: theme.primaryColor, fontSize: 10.0),),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(product : product),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () => Navigator.of(context).pushNamed('/search'),
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              semanticLabel: 'website',
            ),
            onPressed: () => Navigator.of(context).pushNamed('/website'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                  'Pages',
                style: TextStyle(
                  height: 6,
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
              title: Text(
                  'Home',
              style: TextStyle(color: Theme.of(context).primaryColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.search, color: Theme.of(context).primaryColor),
              title: Text(
                  'Search',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/search');
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city, color: Theme.of(context).primaryColor),
              title: Text(
                  'Favorite Hotels',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/favorite');
              },
            ),
            ListTile(
              leading: Icon(Icons.language, color: Theme.of(context).primaryColor),
              title: Text(
                  'Website',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/website');
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
              title: Text(
                  'My Page',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onTap: () {
                Navigator.of(context).pushNamed('/mypage');
              },
            ),
          ],
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context),
          );
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
