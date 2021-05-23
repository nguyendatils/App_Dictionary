import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:dictionary_2/pages/search_result.dart';
import 'package:flutter/material.dart';

import 'fav_list.dart';
import 'list_word.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  List<Word> words = new List();
  DbHelp databaseHelp = DbHelp.instance;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: databaseHelp.getAllWord(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('error');
          var data = snapshot.data;
          print(data);
          return snapshot.hasData ? FavList(data) : new Center(child: Text('No word that include this keyword'),);
        },
      ),
    );
  }
}
