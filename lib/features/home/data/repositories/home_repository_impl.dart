import 'package:ruta_flutter/features/home/data/datasources/local_database.dart';
import 'package:ruta_flutter/features/home/data/models/level_model.dart';
import 'package:ruta_flutter/features/home/domain/repositories/level_repository.dart';
import 'package:sqflite/sqflite.dart';

class LevelRepositoryImpl implements LevelRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<LevelModel>> getLevel(String module) async {
    final db = await _database;
    final maps = await db.query(
      'level',
      where: 'module = ?',
      whereArgs: [module],
    );

    return List.generate(maps.length, (i) {
      return LevelModel(
        id: maps[i]['id'] as int,
        module: maps[i]['module'] as String,
        title: maps[i]['title'] as String,
        description: maps[i]['description'] as String,
        points: maps[i]['points'] as int,
      );
    });
  }
}
