import 'package:dictionary_2/Widgets/list_word.dart';
import 'file:///H:/Android%20Project/dictionary_2/lib/pages/search_result.dart';
import 'package:dictionary_2/database/dbhelp.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_2/models/word.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  DbHelp databaseHelp = DbHelp.instance;
  String keyword = 'cghchgchghg';
  List<Word> words = new List();

  @override
  void initState() {
    // TODO: implement initState
    databaseHelp.getCount();
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
              words = await databaseHelp.searchExactly(keyword);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResult(word: words[0])),
              );

              setState(() {

              });
            },
          ),
        ),
        FutureBuilder(
          future: databaseHelp.searchWord(keyword),
          builder: (context, snapshot) {
            if (snapshot.hasError) print('error');
            var data = snapshot.data;
            print(keyword);
            print(data);
            return snapshot.hasData ? WordList(data) : new Center(child: Text('No word that include this keyword'),);
          },
        )


      ]
    );
  }
}


