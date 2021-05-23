import 'file:///H:/Android%20Project/dictionary_2/lib/pages/search_result.dart';
import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavList extends StatelessWidget {

  List<Word> words;

  FavList(List<Word> this.words, {
    Key key
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: words.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResult(word: words[index])),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 24, top: 12, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    words[index].word,
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
                      Word fav = Word(
                        id: words[index].id,
                        word: words[index].word,
                        description: words[index].description,
                        pronounce: words[index].pronounce,
                        is_fav: 'false',
                      );
                      databaseHelp.addFav(fav);
                      print('remove fav');
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
