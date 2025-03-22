import 'package:ruta_flutter/features/final_exam/data/models/exam_question_model.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';
import 'package:ruta_flutter/features/final_exam/domain/repositories/exam_repository.dart';
import '../datasources/local_exam_data_source.dart';

// Esta clase se encarga de trabajar qué datos se necesitan y cómo se transforman (lógica de negocio).
class ExamRepositoryImpl implements ExamRepository {
  final LocalExamDataSource _localDataSource;

  ExamRepositoryImpl(this._localDataSource);

  // Pre-cargar las preguntas
  Future<void> preloadQuestions() async {
    final List<ExamQuestionModel> preloadedQuestions = [
      ExamQuestionModel(
        id: '1',
        questionText: '¿Cuál es la capital de Francia?',
        options: ['A) Madrid', 'B) París', 'C) Berlín', 'D) Roma'],
        correctAnswer: 'B',
      ),
      ExamQuestionModel(
        id: '2',
        questionText: '¿Cuál es el río más largo del mundo?',
        options: ['A) Amazonas', 'B) Nilo', 'C) Yangtsé', 'D) Misisipi'],
        correctAnswer: 'A',
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
      ),
      // Agrega más preguntas aquí...
    ];

    // Insertar las preguntas en la base de datos
    for (final question in preloadedQuestions) {
      await _localDataSource.insert('exam_questions', question.toMap());
    }
  }

  @override
  Future<List<ExamQuestion>> getFinalExamQuestionsByModule(
      String moduleId) async {
    final rawQuestions = await _localDataSource.query(
      'exam_questions',
      where: 'moduleId = ?',
      whereArgs: [moduleId],
    );

    if (rawQuestions.isEmpty) {
      print(
          'No se encontraron preguntas en la base de datos para el módulo: $moduleId');
    }

    return rawQuestions.map((map) {
      return ExamQuestion(
        id: map['id'],
        questionText: map['questionText'],
        options: List<String>.from(map['options']),
        correctAnswer: map['correctAnswer'],
      );
    }).toList();
  }

  @override
  Future<void> saveUserAnswer(String questionId, String selectedAnswer) async {
    await _localDataSource.insert(
      'user_answers',
      {
        'questionId': questionId,
        'selectedAnswer': selectedAnswer,
      },
    );
  }

  @override
  Future<List<String>> getCorrectAnswers(List<String> questionIds) async {
    final rawQuestions = await _localDataSource.query(
      'exam_questions',
      where: 'id IN (${questionIds.map((_) => '?').join(',')})',
      whereArgs: questionIds,
    );

    return rawQuestions.map((map) => map['correctAnswer'] as String).toList();
  }
}
