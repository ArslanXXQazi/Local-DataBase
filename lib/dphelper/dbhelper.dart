import 'dart:io';
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
     colId integer primary key
     colTitle text
     colDescriptions text
     colDate text
     
     ) 
      '''
    );
  }

}