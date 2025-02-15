import 'package:ruta_flutter/features/home/data/datasources/level_local_database.dart';
import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/topic_repository.dart';
import 'package:sqflite/sqflite.dart';

class TopicRepositoryImpl implements TopicRepository {
  final LevelLocalDatabaseHelper _dbHelper = LevelLocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<TopicModel>> getTopics(int levelId) async {
    final db = await _database;
    final maps = await db.query(
      'topic',
      where: 'level_id = ?',
      whereArgs: [levelId],
    );

    return List.generate(maps.length, (i) {
      return TopicModel(
        id: maps[i]['id'] as String,
        title: maps[i]['title'] as String,
      );
    });
  }
}
