import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qreader/src/models/scan_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DBProvider{
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if( _database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path,'ScanDB.db');
    return openDatabase(
      path,
      version: 1,
      onOpen: (db){

      },
      onCreate: (Database db, int version){
        await db.execute(
        'CREATE TABLE Scans ('
        ' id INTEGER PRIMARYKEY'
        ' tipo TEXT'
        ' valor TEXT'
        ')'
        );
      }
    );

  }

  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.rawInsert(
      "INSERT INTO Scans (id, tipo, valor) "
      "VALUES ( ${nuevoScan.id} , '${nuevoScan.tipo}', '${nuevoScan.valor}')"
    );

    return res;

  }

  nuevoScan(ScanModel nuevoScan)async{
    final db = await database;
    final res = db.insert('Scan', nuevoScan.toJson());
    return res;
  }
}