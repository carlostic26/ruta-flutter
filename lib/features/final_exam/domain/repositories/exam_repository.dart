import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/exam_result.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/user_answer.dart';

abstract class ExamRepository {
  Future<List<ExamQuestion>> getFinalExamQuestionsByModule(String moduleId);
  Future<void> saveUserAnswer(String questionId, String selectedAnswer);
  Future<List<String>> getCorrectAnswers(List<String> questionIds);
  Future<ExamResult> calculateExamResult(List<UserAnswer> userAnswers);
}
