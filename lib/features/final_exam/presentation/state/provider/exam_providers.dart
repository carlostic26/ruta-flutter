import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/final_exam/data/datasources/local_exam_data_source.dart';
import 'package:ruta_flutter/features/final_exam/data/repositories/exam_repository_impl.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';

// Proveedor para el DataSource
final localExamDataSourceProvider = Provider<LocalExamDataSource>((ref) {
  return LocalExamDataSource();
});

// Proveedor para el Repositorio
final examRepositoryProvider = Provider<ExamRepositoryImpl>((ref) {
  final dataSource = ref.read(localExamDataSourceProvider);
  return ExamRepositoryImpl(dataSource);
});

// Proveedor para el estado del examen
final examStateProvider = StateNotifierProvider<ExamNotifier, ExamState>((ref) {
  final repository = ref.read(examRepositoryProvider);
  return ExamNotifier(repository);
});

// Estado del examen
class ExamState {
  final List<ExamQuestion> questions;
  final Map<String, String> userAnswers;
  final int currentQuestionIndex;
  final bool isExamFinished;

  ExamState({
    required this.questions,
    this.userAnswers = const {},
    this.currentQuestionIndex = 0,
    this.isExamFinished = false,
  });

  // Método copyWith
  ExamState copyWith({
    List<ExamQuestion>? questions,
    Map<String, String>? userAnswers,
    int? currentQuestionIndex,
    bool? isExamFinished,
  }) {
    return ExamState(
      questions: questions ?? this.questions,
      userAnswers: userAnswers ?? this.userAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isExamFinished: isExamFinished ?? this.isExamFinished,
    );
  }
}

// Notifier para manejar el estado del examen
class ExamNotifier extends StateNotifier<ExamState> {
  final ExamRepositoryImpl repository;

  ExamNotifier(this.repository) : super(ExamState(questions: []));

  // Cargar preguntas
  Future<void> loadQuestions(String moduleId) async {
    final questions = await repository.getFinalExamQuestionsByModule(moduleId);
    state = state.copyWith(questions: questions);
  }

  // Guardar respuesta del usuario
  void saveAnswer(String questionId, String selectedAnswer) {
    final updatedAnswers = Map<String, String>.from(state.userAnswers)
      ..[questionId] = selectedAnswer;
    state = state.copyWith(userAnswers: updatedAnswers);
  }

  // Cambiar a la siguiente pregunta
  void nextQuestion() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
    } else {
      state = state.copyWith(isExamFinished: true);
    }
  }
}
