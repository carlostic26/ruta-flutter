import 'package:ruta_flutter/core/database/database_helper.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/subtopic_repository.dart';
import 'package:sqflite/sqflite.dart';

class SubtopicRepositoryImpl implements SubtopicRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

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

  @override
  Future<int> countAllSubtopicsByModule(String module) async {
    final db = await _database;

    try {
      // Consultar todos los subtopics del módulo
      final maps = await db.query(
        'subtopic',
        where: 'module = ?',
        whereArgs: [module],
      );

      // Retornar el número de subtopics (longitud de la lista de resultados)
      return maps.length;
    } catch (e) {
      // Manejar errores (por ejemplo, problemas con la base de datos)
      print('Error al contar subtopics: $e');
      throw Exception('Error al contar subtopics para el módulo $module');
    }
  }
}
