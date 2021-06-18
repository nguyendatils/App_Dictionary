import 'package:dictionary_2/pages/search_result.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordList extends StatelessWidget {

  List<Word> words;
  String table;

  WordList(List<Word> this.words, String this.table, {
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
                MaterialPageRoute(builder: (context) => SearchResult(word: words[index], table: table,)),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                words[index].word,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
