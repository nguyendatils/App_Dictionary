/*import 'package:dictionary_2/pages/home_page.dart';
import 'package:flutter/material.dart';


import 'pages/search_result.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/word' : (context) => SearchResult()
      },
    )
  );
}*/



import 'package:dictionary_2/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_2/pages/start_page.dart';
import 'pages/search_result.dart';


void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => StartPage(),
        '/home' : (context) => HomePage(),
        '/word' : (context) => SearchResult()
      },
    )
  );
}


