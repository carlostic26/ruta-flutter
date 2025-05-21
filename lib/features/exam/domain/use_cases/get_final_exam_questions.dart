import 'package:rutas_flutter/features/exam/domain/entities/exam_question.dart';
import 'package:rutas_flutter/features/exam/domain/repositories/exam_repository.dart';

class GetFinalExamQuestions {
  final ExamRepository repository;

  GetFinalExamQuestions(this.repository);

  Future<List<ExamQuestion>> call(String moduleId) async {
    return await repository.getFinalExamQuestionsByModule(moduleId);
  }
}
