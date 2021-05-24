import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/database/dbhelp_va.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/material.dart';

import 'fav_list.dart';

class Favorites extends StatefulWidget {

  Favorites({this.table});
  String table;

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  List<Word> words = new List();
  DbHelp databaseHelp = DbHelp.instance;
  DbHelp_va databaseHelp_va = DbHelp_va.instance;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: widget.table == 'av' ? databaseHelp.getAllWord() : databaseHelp_va.getAllWord(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('error');
          var data = snapshot.data;
          return snapshot.hasData ? FavList(data,widget.table) : new Center(child: Text('No word that include this keyword'),);
        },
      ),
    );
  }
}
