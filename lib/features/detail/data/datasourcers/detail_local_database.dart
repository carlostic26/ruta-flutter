import 'package:ruta_flutter/features/home/data/datasources/level_local_database.dart';

class DetailLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createDetailTable() async {
    final db = await dbHelper.getDatabase();

    await db.execute('''
        CREATE TABLE detail(
          id INTEGER PRIMARY KEY AUTOINCREMENT,  
          subtopic_id TEXT,
          definition TEXT,
          img_url TEXT,
          code_example TEXT,          
          FOREIGN KEY (subtopic_id) REFERENCES subtopic(id) ON DELETE CASCADE
        );
      ''');

    _insertDetails(db);
  }

  Future<void> _insertDetails(db) async {
    // Insertar descripción para el subtema 1 (Declaración de Variables)
    await db.insert('detail', {
      'subtopic_id': 's1t1', // Relacion: me traigo el subtoic 1 del topic 1
      'title': 'Declaración de Variables', //TODO: traer el titulo del subtopic
      'detail':
          'En Dart, las variables se declaran usando la palabra clave `var` o un tipo específico.',
      'code_example': 'var nombre = "Juan";\nint edad = 25;',
    });

    await db.insert('detail', {
      'subtopic_id': 's2t1',
      'title': 'Declaración de Variables', //TODO: traer el titulo del subtopic
      'detail':
          'En Dart, las variables se declaran usando la palabra clave `var` o un tipo específico.',
      'code_example': 'var nombre = "Juan";\nint edad = 25;',
    });
  }
}
