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
    '''




    );
  }

  createWithModel(MainModel model) async {
    Database db = await instance.database;
    final data = {
      'title': model.title,
      'description': model.description,
    };
    var check = await db.insert('notes', data);
    if (check == null) {
      print('Data did not insert');
    } else {
      print('Data Inserted Successfully');
    }
  }

 Future<int> createWithOutModel({ required String title, required String description}) async {

 Database db=await instance.database;
 final data={
   'title':title,
   'description':description,
 };
 var check = await db.insert('notes', data);
 if (check == null) {
   print('Data did not insert');
   return 0;
 } else {
   print('Data Inserted Successfully');
   return 1;
 }

 }

  Future<List<Map<String, dynamic>>> read() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('notes',);
    return result;
  }

  Future<int> deleteData(int id) async {
    Database db=await instance.database;
    return await db.delete('notes',where: 'id=?',whereArgs: [id]);
  }


  Future<int> updateData(int id, {required String title, required String description}) async {
    Database db = await instance.database;
    final data = {
      'title': title,
      'description': description,
    };
    int result = await
    db.update(
      'notes',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result > 0) {
      print('Data Updated Successfully');
    } else {
      print('Data Update Failed');
    }
    return result;
  }

}






