import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';
import 'package:ruta_flutter/features/final_exam/domain/repositories/exam_repository.dart';
import '../datasources/local_exam_data_source.dart';

class ExamRepositoryImpl implements ExamRepository {
  final LocalExamDataSource _localDataSource;

  ExamRepositoryImpl(this._localDataSource);

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
