import 'package:path/path.dart';
import 'package:ruta_flutter/features/detail/data/datasourcers/detail_local_database.dart';
import 'package:ruta_flutter/features/topic/data/datasources/subtopic_local_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';
import 'package:ruta_flutter/features/topic/data/datasources/topic_local_database.dart';
import 'package:ruta_flutter/features/score/data/datasources/score_local_database.dart';

class LocalDatabaseHelper {
  Database? _database;
  int dbVersion = 32;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'ruta_flutter_$dbVersion.db'),
      version: 1,
      onCreate: (db, version) async {
        // Delegar la creación de tablas a cada feature
        await LevelLocalDatabaseHelper().createLevelTable(db);
        await TopicLocalDatabaseHelper().createTopicTable(db);
        await SubtopicLocalDatabaseHelper().createSubtopicTable(db);
        await DetailLocalDatabaseHelper().createDetailTable(db);
        await ScoreLocalDatabaseHelper().createScoreTable(db);

        /*

      LevelLocalDatabaseHelper levelDb = LevelLocalDatabaseHelper();
      levelDb.createLevelTable(db);

      SubtopicLocalDatabaseHelper subtopicDb = SubtopicLocalDatabaseHelper();
      subtopicDb.createSubtopicTable(db);

      //Llamado a la creación de las tablas de topic y subtopic desde este feature (level)
      TopicLocalDatabaseHelper topicDb = TopicLocalDatabaseHelper();
      topicDb.createTopicTable(db);

      DetailLocalDatabaseHelper detailDb = DetailLocalDatabaseHelper();
      detailDb.createDetailTable(db);

      ScoreLocalDatabaseHelper scoreDb = ScoreLocalDatabaseHelper();
      scoreDb.createScoreTable(db);
      },
      */
      },
    );
  }
}
