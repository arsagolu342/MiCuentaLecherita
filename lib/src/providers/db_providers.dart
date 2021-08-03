import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tu_cuenta_lecherita/src/models/notes_models.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

   Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'CuentaLecherita.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Notes(
          id  INTEGER PRIMARY KEY,
          asunt TEXT,
          note TEXT,          
          active BOOLEAN
        )      
      ''');
    });
  }

  Future<int> insert(Note newElement) async {
    final db = await database;
    final newId = await db.insert('Notes', newElement.toJson());
    return newId;
  }

  Future<dynamic> list() async {
    final db = await database;
    final result = await db.query('Notes');
    return result.isNotEmpty
        ? result.map((t) => Note.fromJson(t)).toList()
        : [];
  }
}
 