import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';

class SubtopicLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  //SubTopicLocalDatabaseHelper(this.dbHelper);

  Future<void> createSubtopicTable() async {
    final db = await dbHelper.getDatabase();

    await db.execute('''
        CREATE TABLE subtopic(
          id TEXT PRIMARY KEY,
          topic_id TEXT,
          module TEXT,
          title TEXT,
          PRIMARY KEY (module, topic_id, id), -- Clave primaria compuesta
          FOREIGN KEY (module, topic_id) REFERENCES topic(module, id) ON DELETE CASCADE
        );
      ''');

    _insertSubtopicsJrLevel1(db);
  }

  Future<void> _insertSubtopicsJrLevel1(db) async {
    // Topic 1 - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't1l1', //id de donde viene (Topic 1 del nivel 1)
      'id': 's1t1', //id de subtopic actual (Subtopic 1 del topic 1)
      'module': 'Jr',
      'title': 'Declaración de Variables',
    });

    await db.insert('subtopic', {
      'topic_id': 't1l1',
      'id': 's2t1',
      'module': 'Jr',
      'title': 'Tipos de Datos Primitivos',
    });

    // Topic 2 - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't2l1',
      'id': 's1t2',
      'module': 'Jr',
      'title': 'Funciones Básicas',
    });

    await db.insert('subtopic', {
      'topic_id': 't2l1',
      'id': 's2t2',
      'module': 'Jr',
      'title': 'Parámetros y Retorno',
    });

    // Topic 3 (initState y dispose)
    await db.insert('subtopic', {
      'topic_id': 't3l1',
      'id': 's1t3',
      'module': 'Jr',
      'title': 'Uso de initState',
    });
  }
}
