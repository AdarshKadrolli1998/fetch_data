import 'dart:io';
import 'package:network_api/model/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName="FetchData.db";
  static final _databaseVersion = 1;

  static final tableUser = 'user_details';
  static final columnId ='id';
  static final columnName = 'name';
  static final columnUserName = 'username';
  static final columnEmail = 'email';
  static final columnPhone = 'phone';
  static final columnWebsite = 'website';
  static final tableAddress = 'address';
  static final columnAdrsId = 'adrs_id';
  static final columnStreet = 'street';
  static final columnSuite = 'suite';
  static final columnCity = 'city';
  static final columnZipcode = 'zipcode';
  static final tableGeo = 'geo';
  static final columnGeoId = 'geo_id';
  static final columnLat = 'lat';
  static final columnLng = 'lng';
  static final tableCompany = 'company';
  static final columnCmpId = 'Cmp_Id';
  static final columnCmpName = 'cmp_name';
  static final columnCatchPhrase = 'catch_phrase';
  static final columnBs = 'bs';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance=DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE $tableUser(
    $columnId INTEGER PRIMARY KEY,
    $columnName TEXT NOT NULL,
    $columnUserName TEXT NOT NULL,
    $columnEmail TEXT NOT NULL,
    $columnPhone INTEGER NOT NULL,
    $columnWebsite TEXT NOT NULL
    )
    ''');

    // await db.execute('''
    // CREATE TABLE $tableAddress(
    // $columnAdrsId INTEGER,
    // FOREIGN KEY(columnAdrsId) REFERENCES $tableUser(columnId),
    // $columnStreet TEXT NOT NULL,
    // $columnSuite TEXT NOT NULL,
    // $columnCity TEXT NOT NULL,
    // $columnZipcode INTEGER NOT NULL,
    // )
    // ''');
    //
    // await db.execute('''
    // CREATE TABLE $tableGeo(
    // $columnGeoId INTEGER,
    // FOREIGN KEY(columnGeoId) REFERENCES $tableUser(columnId),
    // $columnLat INTEGER NOT NULL,
    // $columnLng INTEGER NOT NULL
    // )
    // ''');
    //
    // await db.execute('''
    // CREATE TABLE $tableCompany(
    // $columnCmpId INTEGER,
    // FOREIGN KEY(columnCmpId) REFERENCES $tableUser(columnId),
    // $columnCmpName TEXT NOT NULL,
    // $columnCatchPhrase TEXT NOT NULL,
    // $columnBs TEXT NOT NULL
    // )
    // ''');
  }

}
