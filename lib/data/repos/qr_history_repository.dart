import 'package:qr_code_utility/core/database/database_helper.dart';
import 'package:qr_code_utility/core/utils/logger_util.dart';
import 'package:qr_code_utility/data/models/qr_history_model.dart';
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
    } catch (error, stackTrace) {
      LoggerUtil.error('Insert error: $error', error, stackTrace);
      rethrow;
    }
  }

  Future<List<QrHistoryModel>> getAllHistory() async {
    try {
      final db = await _databaseHelper.database;
      final maps = await db.query(
        DatabaseHelper.table,
        orderBy: '${DatabaseHelper.columnTime} DESC',
      );

      return maps.map(QrHistoryModel.fromMap).toList();
    } catch (error, stackTrace) {
      LoggerUtil.error('Get all error: $error', error, stackTrace);
      rethrow;
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

      return maps.map(QrHistoryModel.fromMap).toList();
    } catch (error, stackTrace) {
      LoggerUtil.error('Filter error: $error', error, stackTrace);
      rethrow;
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
    } catch (error, stackTrace) {
      LoggerUtil.error('Delete error: $error', error, stackTrace);
      rethrow;
    }
  }

  Future<void> clearAllHistory() async {
    try {
      final db = await _databaseHelper.database;
      await db.delete(DatabaseHelper.table);
    } catch (error, stackTrace) {
      LoggerUtil.error('Clear error: $error', error, stackTrace);
      rethrow;
    }
  }
}
