import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet!'),
      );
    }

    if (appState.favorites.length == 1) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child:
                    Text('You have ' '${appState.favorites.length} favorite:'),
              ),
              for (var pair in appState.favorites)
                ListTile(
                  leading: Icon(Icons.delete_outline),
                  title: Text(pair.asLowerCase),
                )
            ],
          ),
        ),
      );
    } else {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${appState.favorites.length} favorites:'),
          ),
          for (var pair in appState.favorites)
            ListTile(
              leading: InkWell(
                  onTap: () {
                    appState.removeFavorite();
                  },
                  child: Icon(Icons.delete_outline)),
              title: Text(
                pair.asLowerCase,
              ),
            ),
        ],
      );
    }
  }
}
