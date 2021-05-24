import 'file:///H:/Android%20Project/dictionary_2/lib/pages/search_result.dart';
import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/database/dbhelp_va.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavList extends StatefulWidget {

  final List<Word> words;
  String table;

  FavList(List<Word> this.words, String this.table, {
    Key key
  }):super(key: key);
  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {

  String _is_fav;

  void _initState(int index) {
    // TODO: implement initState
    _is_fav = widget.words[index].is_fav;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.words.length,
        itemBuilder: (BuildContext context, int index){
          _initState(index);
          return _is_fav == 'true' ? InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResult(word: widget.words[index], table: widget.table,),),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 24, top: 12, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.words[index].word,
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      DbHelp databaseHelp = DbHelp.instance;
                      DbHelp_va databaseHelp_va = DbHelp_va.instance;
                      Word fav = Word(
                        id: widget.words[index].id,
                        word: widget.words[index].word,
                        description: widget.words[index].description,
                        pronounce: widget.words[index].pronounce,
                        is_fav: 'false',
                      );
                      widget.table == 'av' ? databaseHelp.addFav(fav) : databaseHelp_va.addFav(fav);
                      setState(() {
                        _is_fav = 'false';
                      });
                      print('remove fav');
                    },
                  )
                ],
              ),
            ),
          ) : Container();
        },
      ),
    );
  }
}

