import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:hiking_album/src/utils/constants.dart';
import 'dart:convert';
import 'package:csv/csv.dart';

class DatabaseHelper{
  static final DatabaseHelper _INSTANCE = new DatabaseHelper.make();

  factory DatabaseHelper() => _INSTANCE;

  static Database _db;

  DatabaseHelper.make();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'sqlite.db');
    var Db = openDatabase(path, version: 1, onCreate: _onCreate);

    return Db;
  }

  void _onCreate(Database db, int version) async {
    ///山と地方のデータベースを作成
    ///csvから抜き出したデータの型とデータベースの型は一致しているのか
    var regionList = await _loadCsvData('assets/RegionList.csv');
    var list1 = await _loadCsvData('assets/Hyakumeizan.csv');

    await db.execute(
      "CREATE TABLE ${RegionList.TABLE_NAME} ("
          "${RegionList.COLUM_ID} INTEGER PRIMARY KEY,"
          "${RegionList.COLUM_NAME} TEXT)"
    );

    for (var item in regionList) {
      await db.insert(RegionList.TABLE_NAME, {
        RegionList.COLUM_ID: item[0],
        RegionList.COLUM_NAME: item[1]
      });
    }

    await db.execute(
      "CREATE TABLE ${Hyakumeizan.TABLE_NAME} ("
          "${Hyakumeizan.COLUM_ID} TEXT PRIMARY KEY,"
          "${Hyakumeizan.COLUM_HEIGHT} INTEGER,"
          "${Hyakumeizan.COLUM_NAME} TEXT,"
          "${Hyakumeizan.COLUM_REGION_ID} INTEGER,"
          "FOREIGN KEY (${Hyakumeizan.COLUM_REGION_ID}) REFERENCES ${RegionList.TABLE_NAME} (${RegionList.COLUM_ID}))"
    );

    for (var item in list1) {
      await db.insert(Hyakumeizan.TABLE_NAME, {
        Hyakumeizan.COLUM_ID: item[0],
        Hyakumeizan.COLUM_NAME: item[1],
        Hyakumeizan.COLUM_HEIGHT: item[2],
        Hyakumeizan.COLUM_REGION_ID: item[3]
      });
    }
  }

  Future<List<Map>> getHyakumeizanList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM ${Hyakumeizan.TABLE_NAME} ORDER BY ${Hyakumeizan.COLUM_ID}"
    );

    return result;
  }

  Future<List<List<dynamic>>> _loadCsvData(var path) async {
    final myData = await rootBundle.loadString(path);
    List<List<dynamic>> fields = CsvToListConverter().convert(myData);
    return fields;
  }
}