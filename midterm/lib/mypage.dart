import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'detail.dart' as detail;
import 'model/product.dart';

class MyPage extends StatelessWidget {
  Route _createRoute(Product product) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => detail.DetailPage(product: product,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    List<Product> showList = (detail.saved.length != 0) ? detail.saved : [
      Product(
        category: Category.hotel,
        id: -1,
        stars: 0,
        name: "No Favorites",
        address: "Not exist",
        phone: "Not exist",
        description: "Not exist"),
    ];

    //Auto playing carousel
    final CarouselSlider autoPlayDemo = CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: showList.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      child: Image.asset(product.assetName, fit: BoxFit.cover, width: 1000.0,),
                      onTap: () {
                        if(product.id != -1) {
                          Navigator.of(context).push(_createRoute(product));
                        }
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Text(
                          product.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
    
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Column(children: [
                Text('Auto Playing Carousel'),
                autoPlayDemo,
              ])),
        ],
      ),
    );
  }
}

