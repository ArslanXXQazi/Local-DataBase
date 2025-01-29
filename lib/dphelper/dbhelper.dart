import 'dart:core';
import 'dart:io';
import 'package:localdatabase/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbClass {
  DbClass._privateConstructor();
  static final instance = DbClass._privateConstructor();
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  _initDatabase() async {
    Directory document = await getApplicationDocumentsDirectory();
    String path = join(document.path, 'notes');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT
      )
    ''');
  }

  create(MainModel model) async {
    Database db = await instance.database;
    final data = {
      'title': model.title,
      'descriptions': model.description,
    };
    var check = await db.insert('notes', data);
    if (check == null) {
      print('Data did not insert');
    } else {
      print('Data Inserted Successfully');
    }
  }

  Future<List<Map<String, dynamic>>> read() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('notes',);
    return result;
  }
}






