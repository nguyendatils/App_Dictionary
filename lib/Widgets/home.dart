import 'package:dictionary_2/Widgets/list_word.dart';
import 'package:dictionary_2/pages/search_result.dart';
import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/database/dbhelp_va.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_2/models/word.dart';

class Home extends StatefulWidget {

  Home({this.table});
  String table;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  DbHelp databaseHelp = DbHelp.instance;
  DbHelp_va databaseHelp_va = DbHelp_va.instance;
  String keyword = 'cghchgchghg';
  List<Word> words = new List();

  @override
  void initState() {
    // TODO: implement initState
    databaseHelp.getCount();
    print(widget.table);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search your word',
            ),
            onChanged: (value) {
              if (value == '') keyword = 'nghvcggd';
              else keyword = value;

              setState(() {

              });
            },
            onSubmitted: (value) async {
              if (value == '') keyword = 'nghvcggd';
              else keyword = value;
              words = widget.table == 'av' ? await databaseHelp.searchWord(keyword) : await databaseHelp_va.searchWord(keyword);
              if (words.length != 0) Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResult(word: words[0],table: widget.table,)),
              );

              setState(() {

              });
            },
          ),
        ),
        FutureBuilder(
          future: widget.table == 'av' ? databaseHelp.searchWord(keyword) : databaseHelp_va.searchWord(keyword),
          builder: (context, snapshot) {
            if (snapshot.hasError) print('error');
            var data = snapshot.data;
            return snapshot.hasData ? WordList(data,widget.table) : new Center(child: Text('No word that include this keyword'),);
          },
        )


      ]
    );
  }
}


