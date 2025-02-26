import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';

class DetailLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createDetailTable() async {
    final db = await dbHelper.getDatabase();

    await db.execute('''
        CREATE TABLE detail(
          id INTEGER PRIMARY KEY AUTOINCREMENT,  
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
      'subtopic_id': 's01t1',
      'module': 'Jr',
      'definition':
          'En Dart, las variables se declaran usando la palabra clave `var` o un tipo específico.',
      'img_url':
          'https://www.reanimasoluciones.com/images/lenguaje-dart-flutter.jpg',
      'code_example': 'var nombre = "Juan";\nint edad = 25;',
    });

    // Insertar descripción para el subtema 2 del tema 1
    await db.insert('detail', {
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
