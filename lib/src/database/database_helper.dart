import 'dart:async';
import 'dart:io';
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
    var regionList = await _loadCsvData('lib/csv/RegionList.csv');
    var list1 = await _loadCsvData('lib/csv/Hyakumeizan.csv');

    await db.execute(
      "CREATE TABLE ${RegionList.TABLE_NAME} ("
          "${RegionList.COLUM_ID} INTEGER PRIMARY KEY"
          "${RegionList.COLUM_NAME} TEXT)"
    );

    for (var item in regionList) {
      await db.insert(RegionList.TABLE_NAME, {
        RegionList.COLUM_ID: item[0],
        RegionList.COLUM_NAME: item[1]
      });
    }

    await db.execute(
      "CREATE TABLE ${Hyakumeizan.TABLE_NAME} ()"
    );
  }

  Future<List> getHyakumeizanList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM ${Hyakumeizan.TABLE_NAME} ORDER BY ${Hyakumeizan.COLUM_ID}"
    );

    return result.toList();
  }

  Future<List<List<dynamic>>> _loadCsvData(var path) async {
    final file = new File(path).openRead();
    final fields = await file.transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();

    return fields;
  }
}