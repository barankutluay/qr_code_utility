import 'package:myproject/core/database/database_helper.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/data/models/qr_history_model.dart';
import 'package:sqflite/sqflite.dart';

final class QrHistoryRepository {
  QrHistoryRepository._();
  static final QrHistoryRepository instance = QrHistoryRepository._();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<int> insertHistory(QrHistoryModel history) async {
    try {
      final db = await _databaseHelper.database;
      return await db.insert(
        DatabaseHelper.table,
        history.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      LoggerUtil.error('Insert error: $e');
      throw Exception('Insert error: $e');
    }
  }

  Future<List<QrHistoryModel>> getAllHistory() async {
    try {
      final db = await _databaseHelper.database;
      final maps = await db.query(
        DatabaseHelper.table,
        orderBy: '${DatabaseHelper.columnTime} DESC',
      );
      return maps.map((map) => QrHistoryModel.fromMap(map)).toList();
    } catch (e) {
      LoggerUtil.error('Get all error: $e');
      throw Exception('Get all error: $e');
    }
  }

  Future<List<QrHistoryModel>> getHistoryByType(int type) async {
    try {
      final db = await _databaseHelper.database;
      final maps = await db.query(
        DatabaseHelper.table,
        where: '${DatabaseHelper.columnType} = ?',
        whereArgs: [type],
      );
      return maps.map((map) => QrHistoryModel.fromMap(map)).toList();
    } catch (e) {
      LoggerUtil.error('Filter error: $e');
      throw Exception('Filter error: $e');
    }
  }

  Future<int> deleteHistory(int id) async {
    try {
      final db = await _databaseHelper.database;
      return await db.delete(
        DatabaseHelper.table,
        where: '${DatabaseHelper.columnId} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      LoggerUtil.error('Delete error: $e');
      throw Exception('Delete error: $e');
    }
  }

  Future<void> clearAllHistory() async {
    try {
      final db = await _databaseHelper.database;
      await db.delete(DatabaseHelper.table);
    } catch (e) {
      LoggerUtil.error('Clear error: $e');
      throw Exception('Clear error: $e');
    }
  }
}
