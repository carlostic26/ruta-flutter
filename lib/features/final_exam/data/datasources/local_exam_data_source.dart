import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exam_question_model.dart'; // Importar el modelo

class LocalExamDataSource {
  static const String _tableName = 'exam_questions';
  static const String _dbName = 'final_exam2.db';
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

  // Crear la tabla de preguntas y pre-cargar preguntas
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tableName (
      id TEXT PRIMARY KEY,
      questionText TEXT,
      options TEXT,
      correctAnswer TEXT,
      moduleId TEXT
    )
  ''');

    // Añade esta tabla nueva
    await db.execute('''
    CREATE TABLE IF NOT EXISTS user_answers (
      questionId TEXT PRIMARY KEY,
      selectedAnswer TEXT
    )
  ''');

    await _preloadQuestions(db);
  }

  Future<void> _preloadQuestions(Database db) async {
    final preloadedQuestions = [
      // Preguntas para el módulo Jr
      ExamQuestionModel(
        id: '1',
        questionText: '¿Cuál es la capital de Francia?',
        options: ['A) Madrid', 'B) París', 'C) Berlín', 'D) Roma'],
        correctAnswer: 'B',
        moduleId: 'Jr', // Módulo Jr
      ),
      ExamQuestionModel(
        id: '2',
        questionText: '¿Cuál es el río más largo del mundo?',
        options: ['A) Amazonas', 'B) Nilo', 'C) Yangtsé', 'D) Misisipi'],
        correctAnswer: 'A',
        moduleId: 'Jr', // Módulo Jr
      ),
      ExamQuestionModel(
        id: '3',
        questionText: '¿Quién escribió "Cien años de soledad"?',
        options: [
          'A) Pablo Neruda',
          'B) Gabriel García Márquez',
          'C) Mario Vargas Llosa',
          'D) Jorge Luis Borges'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr', // Módulo Jr
      ),

      // Preguntas para el módulo Mid
      ExamQuestionModel(
        id: '4',
        questionText: '¿Cuál es la capital de Colombia?',
        options: ['A) Medellín', 'B) Bogotá', 'C) Cali', 'D) Barranquilla'],
        correctAnswer: 'B',
        moduleId: 'Mid', // Módulo Mid
      ),
      ExamQuestionModel(
        id: '5',
        questionText: '¿Cuál es el idioma oficial de Brasil?',
        options: ['A) Español', 'B) Portugués', 'C) Inglés', 'D) Francés'],
        correctAnswer: 'B',
        moduleId: 'Mid', // Módulo Mid
      ),

      // Preguntas para el módulo Sr
      ExamQuestionModel(
        id: '6',
        questionText: '¿Cuál es el planeta más grande del sistema solar?',
        options: ['A) Tierra', 'B) Júpiter', 'C) Saturno', 'D) Marte'],
        correctAnswer: 'B',
        moduleId: 'Sr', // Módulo Sr
      ),
      ExamQuestionModel(
        id: '7',
        questionText: '¿Quién pintó la Mona Lisa?',
        options: [
          'A) Vincent van Gogh',
          'B) Pablo Picasso',
          'C) Leonardo da Vinci',
          'D) Claude Monet'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr', // Módulo Sr
      ),
      // Agrega más preguntas aquí...
    ];

    // Insertar las preguntas en la base de datos
    for (final question in preloadedQuestions) {
      await db.insert(_tableName, question.toMap());
    }
  }

  Future<void> printAllQuestions() async {
    final db = await getDatabase();
    final questions = await db.query('exam_questions');
    for (final question in questions) {
      print(question);
    }
  }

  // Método genérico para ejecutar consultas
  Future<List<Map<String, dynamic>>> query(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await getDatabase();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  // Método genérico para insertar datos
  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
