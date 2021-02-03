import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName="FetchData.db";
  static final _databaseVersion = 1;

  static final table = 'user';
  static final columnId='id';
  static final columnName= 'name';
  static final columnUserName= 'username';
  static final columnEmail= 'email';
  static final columnAddress= 'address';


}