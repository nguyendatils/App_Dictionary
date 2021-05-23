import 'package:flutter/cupertino.dart';

class Word {
  int id;
  String word;
  String description;
  String pronounce;
  String is_fav;

  Word({this.id, this.word, this.description, this.pronounce, this.is_fav});

  Word.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.word = obj['word'];
    this.description = obj['description'];
    this.pronounce = obj['pronounce'];
    this.is_fav = obj['is_fav'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'word': word,
      'description': description,
      'pronounce': pronounce,
      'is_fav': is_fav,
    };

    return map;
  }
}