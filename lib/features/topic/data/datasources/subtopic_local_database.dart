import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';

class SubTopicLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  //SubTopicLocalDatabaseHelper(this.dbHelper);

  Future<void> createSubTopicTable() async {
    final db = await dbHelper.getDatabase();

    await db.execute('''
        CREATE TABLE subtopic(
          id TEXT PRIMARY KEY,
          topic_id TEXT,
          title TEXT,
          FOREIGN KEY (topic_id) REFERENCES topic(id) ON DELETE CASCADE
        );
      ''');

    _insertSubtopics(db);
  }

  Future<void> _insertSubtopics(db) async {
    // Evaluar si es necesario etiquetar en codigo al nivel desde detail para poder diferenciar por ej s1t1 de los otros niveles

    // Topic 1 - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't1n1', //id de donde viene (Topic 1 del nivel 1)
      'id': 's1t1', //id de subtopic actual (Subtopic 1 del topic 1)
      'title': 'Declaración de Variables',
    });

    await db.insert('subtopic', {
      'topic_id': 't1n1',
      'id': 's2t1',
      'title': 'Tipos de Datos Primitivos',
    });

    // Topic 2 - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't2n1',
      'id': 's1t2',
      'title': 'Funciones Básicas',
    });

    await db.insert('subtopic', {
      'topic_id': 't2n1',
      'id': 's2t2',
      'title': 'Parámetros y Retorno',
    });

    // Topic 3 (initState y dispose)
    await db.insert('subtopic', {
      'topic_id': 't3n1',
      'id': 's1t3',
      'title': 'Uso de initState',
    });
  }
}
