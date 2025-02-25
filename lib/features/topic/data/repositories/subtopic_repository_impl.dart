import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/subtopic_repository.dart';
import 'package:sqflite/sqflite.dart';

class SubtopicRepositoryImpl implements SubtopicRepository {
  final LevelLocalDatabaseHelper _dbHelper = LevelLocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<SubtopicModel>> getSubtopics(
      String topicID, String module) async {
    final db = await _database;
    final maps = await db.query(
      'subtopic',
      where: 'topic_id = ? and module = ?',
      whereArgs: [topicID, module],
    );

    return List.generate(maps.length, (i) {
      return SubtopicModel(
        id: maps[i]['id'] as String,
        title: maps[i]['title'] as String,
        module: maps[i]['module'] as String,
      );
    });
  }
}
