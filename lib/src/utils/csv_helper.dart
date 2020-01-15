import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

class CsvHelper {
  static final CsvHelper _INSTANCE = new CsvHelper.make();

  factory CsvHelper() => _INSTANCE;

  CsvHelper.make();

  Future<List<List<dynamic>>> _loadCsvData(var path) async{
    final file = new File(path).openRead();
    final fields = await file.transform(utf8.decoder)
                              .transform(new CsvToListConverter())
                              .toList();

    return fields;
  }
}