import 'dart:io';

import 'package:myproject/core/utils/logger_util.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static const String _databaseName = 'qr_history.db';
  static const int _databaseVersion = 1;

  static const String table = 'history';
  static const String columnId = '_id';
  static const String columnUrl = 'url';
  static const String columnTime = 'time';
  static const String columnType = 'type';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final String path;

      if (Platform.isAndroid || Platform.isIOS) {
        path = join(await getDatabasesPath(), _databaseName);
      } else {
        final dir = await getApplicationDocumentsDirectory();
        path = join(dir.path, _databaseName);
      }

      return await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
      );
    } catch (error, stackTrace) {
      LoggerUtil.error("Couldn't retrieve database: $error", error, stackTrace);
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUrl TEXT NOT NULL,
        $columnTime TEXT NOT NULL,
        $columnType INTEGER NOT NULL
      )
    ''');
  }
}
