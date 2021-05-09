import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _url = 'https://owlbot.info/api/v4/dictionary/';
  String _token = '549629ce7c520f1af0cbccf40a360b1a2d368064';

  TextEditingController _controller = TextEditingController();

  StreamController _streamController;
  Stream _stream;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
    }
    Response response = await get(Uri.parse(_url + _controller.text.trim()), headers: {"Authorization": "Token " + _token});
    _streamController.add(jsonDecode(response.body));
  }


  @override
  void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: TextFormField(
                    onChanged: (String text){

                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Search your word',
                      contentPadding: EdgeInsets.only(left: 24),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ),
              
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: (){
                  _search();
                },
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Text('Enter a word'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data['definitions'].length,
            itemBuilder: (BuildContext ctx, int index) {
              return ListBody(
                children: [
                  Container(
                    child: ListTile(
                      title: Text(
                        _controller.text.trim() + ' (' + snapshot.data['definitions'][index]['type'] + ')',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    child: Text(
                      snapshot.data['definitions'][index]['definition'],
                    ),
                  )
                ],
              );
            },
          );

        },

      )
    );
  }
}
