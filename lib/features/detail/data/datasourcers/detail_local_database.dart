import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DetailLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createDetailTable(Database db) async {
    await db.execute('''
      CREATE TABLE detail(
        id INTEGER,  
        module TEXT,
        subtopic_id TEXT,
        definition TEXT,
        img_url TEXT,
        code_example TEXT,          
        PRIMARY KEY (module, subtopic_id, id), -- Clave primaria compuesta
        FOREIGN KEY (module, subtopic_id) REFERENCES subtopic(module, id) ON DELETE CASCADE
      );
    ''');

    _insertDetails(db);
  }

  Future<void> _insertDetails(db) async {
    // Insertar descripción para el subtema 1 del tema 1
    await db.insert('detail', {
      'id': 1,
      'subtopic_id':
          's01t1', //TODO: AJUSTAR LOS ID DE SUBTOPIC O TOPIC PORQUE DEBE INCLUIR TAMBIEN EL NIVEL
      'module': 'Jr',
      'definition':
          'En Dart, las variables se declaran usando la palabra clave `var` o un tipo específico.',
      'img_url':
          'https://www.reanimasoluciones.com/images/lenguaje-dart-flutter.jpg',
      'code_example': 'var nombre = "Juan";\nint edad = 25;',
    });

    // Insertar descripción para el subtema 2 del tema 1
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t1',
      'module': 'Jr',
      'definition':
          'En Dart, las variables se declaran usando la palabra clave `var` o un tipo específico.',
      'img_url':
          'https://www.reanimasoluciones.com/images/lenguaje-dart-flutter.jpg',
      'code_example': 'var nombre = "Juan";\nint edad = 25;',
    });
  }
}
