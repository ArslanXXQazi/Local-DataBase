import 'dart:io';
import 'package:localdatabase/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbClass
{
  DbClass._privateConstructor();
  static final instance=DbClass._privateConstructor();
  // String tableName='table_name';
  // String colId='id';
  // String colTitle='title';
  // String colDescriptions='descriptions';
  // String colDate='date';
  Database? _database;

  Future<Database> get database async
  {
    if(_database==null)
      {
        _database=await _initdatabase();
      }
    return _database!;
  }

  _initdatabase ()async
  {
    Directory document= await getApplicationDocumentsDirectory();
    String path=join(document.path,'arslan.Db');
    return await openDatabase(path,version: 1,onCreate:_onCreate);

  }

  _onCreate(Database db,int version) async
  {
    await db.execute(
      '''
     create table tableName(
     id integer primary key,
     title text,
     descriptions text,
     ) 
      '''
    );
  }

  create(MainModel model) async
  {

    Database db= await instance.database;
    final data={
      'title':model.title,
      'descriptions':model.description,
    };

    var check=await db.insert('arslan.Db', data,);
    if(check==null)
      {
        print('Data did not insert');
      }
    else
      {
        print('Data Inserted Successfully');
      }

  }

  withoutmodel( String title, String descriptions) async
  {
    Database db=await instance.database;
    final data=
    {
      'title': title,
      'description': descriptions,
    };

    var check=await db.insert('arslan.Db', data);
    if(check==null)
      {
        print('Data did not insert');
      }
    else
    {
      print('Data insert Successfully');
    }

  }



}





