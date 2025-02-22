import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';

class TopicLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createTopicTable() async {
    final db = await dbHelper.getDatabase();

    await db.execute('''
        CREATE TABLE topic(
          id TEXT PRIMARY KEY,
          level_id INTEGER,
          title TEXT,
          FOREIGN KEY (level_id) REFERENCES level(id) ON DELETE CASCADE
        );
      ''');

    _insertTopics(db);
  }

  Future<void> _insertTopics(db) async {
    // Nivel 1
    await db.insert('topic', {
      'id': 't1n1',
      'level_id': 1,
      'title': 'Variables y Tipos de Datos',
    });

    await db.insert('topic', {
      'id': 't2n1',
      'level_id': 1,
      'title': 'Funciones en Dart',
    });

    // Nivel 2
    await db.insert('topic', {
      'id': 't1n2',
      'level_id': 2,
      'title': 'Ciclo de Vida de Widgets',
    });

    // Nivel 2
    await db.insert('topic', {
      'id': 't1n3',
      'level_id': 3,
      'title': 'Ciclo de Vida de Widgets',
    });
  }
}
