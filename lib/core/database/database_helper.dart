import 'package:myproject/core/utils/logger_util.dart';
import 'package:path/path.dart';
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
      final path = join(await getDatabasesPath(), _databaseName);
      return await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
      );
    } catch (e) {
      LoggerUtil.error(e);
      throw Exception(e);
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
