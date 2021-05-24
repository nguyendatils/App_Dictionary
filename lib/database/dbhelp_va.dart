import 'dart:io';
import 'package:dictionary_2/models/word.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelp_va {

  static final databaseName = 'dict_hh.db';
  static final databaseVersion = 1;
  static final table = 'va';
  static final columnWord = 'word';
  static final columnDes = 'description';
  static final columnPron = 'pronounce';

  //Constructor
  DbHelp_va._privateConstructor();
  static final DbHelp_va instance = DbHelp_va._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database !=null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {

    var databasePath = await getDatabasesPath();
    String path = join(databasePath,databaseName);

    var exists = await databaseExists(path);
    if (!exists) {
      print('Copy database start');
      //not exist
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join('assets',databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }else {
      print('Opening exsiting database');
    }

    return await openDatabase(path);
  }

  //CRUD
  //=========================================================================
  //Insert
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  //Select All
  Future<List<Word>> getAllWord() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query(table, where: 'is_fav = ?', whereArgs: ['true']);
    List<Word> results = allRows.map((word) => Word.fromMap(word)).toList();
    return results;
  }

  //Add/Remove favorite
  Future<void> addFav(Word word) async{
    Database db = await instance.database;
    await db.update(table, word.toMap(), where: 'word = ?', whereArgs: [word.word]);
  }

  //Search word
  Future<List<Word>> searchWord(String word) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query(table, where: 'word LIKE ?', whereArgs: ['$word%'], limit: 10);
    List<Word> results = allRows.map((word) => Word.fromMap(word)).toList();
    return results;
  }

  //SearchExactly
  Future<List<Word>> searchExactly(String word) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query(table, where: 'word = ?', whereArgs: ['$word'], limit: 1);
    List<Word> results = allRows.map((word) => Word.fromMap(word)).toList();
    return results;
  }

  //Raw query
  Future<int> getCount() async {
    Database db = await instance.database;
    print(Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(WORD) FROM $table')));
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(WORD) FROM $table'));
  }

  //Delete
  Future<int> delete(String word) async {
    Database db = await instance.database;
    return await db.delete(table, where:'$columnWord', whereArgs: [word]);
  }



}