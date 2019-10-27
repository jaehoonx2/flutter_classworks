import 'package:flutter/material.dart';
import 'detail.dart' as detail;

class FavoritePage extends StatefulWidget {
  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Hotels'),
      ),
//    body: ListView.builder(
      body: ListView.separated(
          itemCount: detail.saved.length,
          itemBuilder: (context, index) {
            final item = detail.saved[index];
            return Dismissible(
              key: Key(item.name),
              onDismissed: (direction) {
                setState(() {
                  detail.saved.removeAt(index);
                });

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(item.name + " dismissed")));
              },
              background: Container(color: theme.primaryColor),
              child: ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            );
          },
        separatorBuilder: (context, index) {
            return Divider();
        },
      ),
    );
  }
}