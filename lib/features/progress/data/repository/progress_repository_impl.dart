import 'package:ruta_flutter/core/database/database_helper.dart';
import 'package:ruta_flutter/features/progress/data/datasources/progress_local_database.dart';
import 'package:ruta_flutter/features/progress/data/model/progress_model.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/subtopic_repository.dart';
import 'package:sqflite/sqflite.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalDatabaseHelper _dbHelper = ProgressLocalDatabaseHelper();
  final SubtopicRepository _subtopicRepository; // Declaración del campo

  // Constructor que inicializa _subtopicRepository
  ProgressRepositoryImpl(this._subtopicRepository);

  Future<Database> get localDatabase async => await _dbHelper.getDatabase();

  final LocalDatabaseHelper _subtopicDbHelper = LocalDatabaseHelper();
  Future<Database> get subtopicLocalDatabase async =>
      await _subtopicDbHelper.getDatabase();

  @override
  Future<void> createProgressBySubtopic({
    required String module,
    required int levelId,
    required String topicId,
    required String subtopicId,
    required int score,
  }) async {
    final db = await localDatabase;
    await db.insert(
      'progress',
      {
        'module': module,
        'level_id': levelId,
        'topic_id': topicId,
        'subtopic_id': subtopicId,
        'score': score,
      },
    );
  }

  @override
  Future<List<ProgressModel>> getAllModuleProgress(String module) async {
    final db = await localDatabase;
    final maps = await db.query(
      'progress',
      where: 'module = ?',
      whereArgs: [module],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<List<ProgressModel>> getAllLevelProgressByModule({
    required String module,
    required int levelId,
  }) async {
    final db = await localDatabase;
    final maps = await db.query(
      'progress',
      where: 'module = ? AND level_id = ?',
      whereArgs: [module, levelId],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<List<ProgressModel>> getAllTopicProgressByModule({
    required String module,
    required int levelId,
    required String topicId,
  }) async {
    final db = await localDatabase;
    final maps = await db.query(
      'progress',
      where: 'module = ? AND level_id = ? AND topic_id = ?',
      whereArgs: [module, levelId, topicId],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<bool> isSubtopicCompleted(String subtopicId) async {
    final db = await localDatabase;
    final result = await db.query(
      'progress',
      where: 'subtopic_id = ?',
      whereArgs: [subtopicId],
    );
    return result.isNotEmpty;
  }

/*   @override
  Future<bool> isTopicCompleted(
      String module, int levelId, String topicId) async {
    // Obtener todos los subtopics del topic desde la base de datos pre-cargada
    final subtopics = await _subtopicRepository.getSubtopics(topicId, module);

    // Verificar si todos los subtopics están completados
    for (final subtopic in subtopics) {
      final isCompleted = await isSubtopicCompleted(subtopic.id!);
      if (!isCompleted) {
        return false; // Si algún subtopic no está completado, el topic no está completado
      }
    }

    return true;
  }
 */

  @override
  Future<bool> isTopicCompleted(
      String module, int levelId, String topicId) async {
    // Obtener todos los subtopics del topic
    final subtopics = await _subtopicRepository.getSubtopics(topicId, module);

    // Verificar si todos los subtopics están completados
    for (final subtopic in subtopics) {
      final isCompleted = await isSubtopicCompleted(subtopic.id!);
      if (!isCompleted) {
        return false; // Si algún subtopic no está completado, el topic no está completado
      }
    }

    print("Verificando subtopics del topic $topicId");
    for (final subtopic in subtopics) {
      final isCompleted = await isSubtopicCompleted(subtopic.id!);
      print("En impl, Subtopic ${subtopic.id}: ¿Completado? $isCompleted");
    }

    return true; // Todos los subtopics están completados
  }

  @override
  Future<List<String>> getAllCompletedSubtopics() async {
    final db = await localDatabase;
    final result = await db.query('progress', columns: ['subtopic_id']);
    return result.map((map) => map['subtopic_id'] as String).toList();
  }
  //---- Score

  //en este metodo se obtiene los puntajes ya creados por los casos de uso de progress
  @override
  Future<List<int>> getScoresByModule(String module) async {
    final db = await localDatabase;

    // Consultar todos los registros del módulo
    final scores = await db.query(
      'progress',
      where: 'module = ?',
      whereArgs: [module],
    );

    // Agrupar los puntajes por nivel
    final levelScores = <int, int>{};
    for (final score in scores) {
      final level = score['level_id'] as int;
      final amount = score['score'] as int;

      // Sumar los puntajes por nivel
      levelScores[level] = (levelScores[level] ?? 0) + amount;
    }

    // Ordenar los niveles y devolver una lista de puntajes
    final sortedLevels = levelScores.keys.toList()..sort();
    return sortedLevels.map((level) => levelScores[level]!).toList();
  }

  @override
  Future<int> getTotalScoreByLevelOfModule(
      {required String module, required int levelId}) async {
    final db = await localDatabase;

    // Consultar todos los registros del módulo y nivel
    final scores = await db.query(
      'progress',
      where: 'module = ? AND level_id = ?',
      whereArgs: [module, levelId],
    );

    // Sumar los puntajes
    int totalScore = 0;
    for (final score in scores) {
      totalScore += score['score'] as int;
    }

    return totalScore;
  }

  @override
  Future<int> getCompletedSubtopicsByLevel(
      {required String module, required int level}) async {
    final db = await localDatabase;

    // Contar los subtopics completados en el nivel
    final result = await db.rawQuery('''
      SELECT COUNT(*) as count
      FROM progress
      WHERE module = ? AND level_id = ?
    ''', [module, level]);

    return result.first['count'] as int;
  }

  @override
  Future<int> getTotalSubtopicsByLevel(
      {required String module, required int level}) async {
    final db = await subtopicLocalDatabase;

    // Contar el número total de subtopics en el nivel
    final result = await db.rawQuery('''
    SELECT COUNT(*) as count
    FROM subtopic
    JOIN topic ON subtopic.topic_id = topic.id AND subtopic.module = topic.module
    WHERE topic.level_id = ? AND subtopic.module = ?
  ''', [level, module]);

    return result.first['count'] as int;
  }

  @override
  Future<List<String>> getAllCompletedTopics() async {
    final db = await localDatabase;
    final result = await db.query('progress', columns: ['topic_id']);
    return result.map((map) => map['topic_id'] as String).toList();
  }
}
