import 'dart:convert';

import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/database/dbhelp_va.dart';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class SearchResult extends StatefulWidget {
  SearchResult({this.word,this.table});
  final Word word;
  final String table;
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  String _is_fav;
  String mp3_link;
  String _url = 'https://api.dictionaryapi.dev/api/v2/entries/en_US/';

  getmp3() async {
    Response response = await get(Uri.parse(_url + widget.word.word));
    print(jsonDecode(response.body)[0]['phonetics'][0]['audio']);
    mp3_link = jsonDecode(response.body)[0]['phonetics'][0]['audio'];
  }

  final player = AssetsAudioPlayer();

  _play() async{
    try {
      await player.open(
        Audio.network(mp3_link),
      );
    } catch (t) {
      //mp3 unreachable
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _is_fav = widget.word.is_fav;
    getmp3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word.word),
        actions: [
          IconButton(
            icon: Icon(
              _is_fav == 'false' ? Icons.star_border : Icons.star,
              color: Colors.amber,
            ),
            onPressed: (){
              DbHelp databaseHelp = DbHelp.instance;
              DbHelp_va databaseHelp_va = DbHelp_va.instance;
              Word fav = Word(
                id: widget.word.id,
                word: widget.word.word,
                description: widget.word.description,
                pronounce: widget.word.pronounce,
                is_fav: _is_fav == 'true' ? 'false' : 'true',
              );
              widget.table == 'av' ? databaseHelp.addFav(fav) : databaseHelp_va.addFav(fav);
              setState(() {
                _is_fav = _is_fav == 'true' ? 'false' : 'true';
              });
              print(_is_fav);
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.word.word,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: _play,
                      mini: true,
                      child: Icon(Icons.multitrack_audio),
                    ),
                  ]
              ),
              SizedBox(height: 10,),
              Text(
                widget.table == 'av' ? '/${widget.word.pronounce}/' : '',
                style:  TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24,),
              Text(
                widget.word.description,
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


// class SearchResult extends StatelessWidget {
//
//
// }


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
