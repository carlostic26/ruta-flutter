import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Esta clase se encarga de trabajar el cómo se accede a los datos (operaciones CRUD básicas).

class LocalExamDataSource {
  static const String _tableName = 'exam_questions';
  static const String _dbName = 'final_exam.db';
  Database? _database;

  // Inicializar la base de datos
  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crear la tabla de preguntas
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        questionText TEXT,
        options TEXT,
        correctAnswer TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await getDatabase();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
