import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {

  final Word word;

  const SearchResult({Key key, this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word.word),
        actions: [
          IconButton(
            icon: Icon(
              word.is_fav == 'false' ? Icons.star_border : Icons.star,
              color: Colors.amber,
            ),
            onPressed: (){
              DbHelp databaseHelp = DbHelp.instance;
              Word fav = Word(
                id: word.id,
                word: word.word,
                description: word.description,
                pronounce: word.pronounce,
                is_fav: 'true',
              );
              databaseHelp.addFav(fav);
              print('add fav');
            },
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word.word,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                '/${word.pronounce}/',
                style:  TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24,),
              Text(
                word.description,
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// class SearchResult extends StatefulWidget {
//   @override
//   _SearchResultState createState() => _SearchResultState();
// }
//
// class _SearchResultState extends State<SearchResult> {
//
//   Word word;
//
//   @override
//   Widget build(BuildContext context) {
//
//     // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//
//
//   }
// }
