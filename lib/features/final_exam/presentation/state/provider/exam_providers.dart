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
  final bool isTimeOver;

  ExamState({
    required this.questions,
    this.userAnswers = const {},
    this.currentQuestionIndex = 0,
    this.isExamFinished = false,
    this.isTimeOver = false,
  });

  ExamState copyWith({
    List<ExamQuestion>? questions,
    Map<String, String>? userAnswers,
    int? currentQuestionIndex,
    bool? isExamFinished,
    bool? isTimeOver,
  }) {
    return ExamState(
      questions: questions ?? this.questions,
      userAnswers: userAnswers ?? this.userAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isExamFinished: isExamFinished ?? this.isExamFinished,
      isTimeOver: isTimeOver ?? this.isTimeOver,
    );
  }
}

// Notifier para manejar el estado del examen
class ExamNotifier extends StateNotifier<ExamState> {
  final ExamRepositoryImpl repository;

  static const int secondsPerQuestion = 20;
  static const int totalQuestions = 15;
  static const int totalExamDuration = secondsPerQuestion * totalQuestions;

  ExamNotifier(this.repository) : super(ExamState(questions: []));

  Future<void> loadQuestions(String moduleId) async {
    try {
      final questions =
          await repository.getFinalExamQuestionsByModule(moduleId);
      if (questions.isNotEmpty) {
        state = state.copyWith(questions: questions);
      }
    } catch (e) {
      print('Error al cargar preguntas: $e');
    }
  }

  void saveAnswer(String questionId, String selectedAnswer) {
    final updatedAnswers = Map<String, String>.from(state.userAnswers)
      ..[questionId] = selectedAnswer;
    state = state.copyWith(userAnswers: updatedAnswers);
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
    } else {
      state = state.copyWith(isExamFinished: true);
    }
  }

  void finishExamByTime() {
    final updatedAnswers = Map<String, String>.from(state.userAnswers);

    for (final question in state.questions) {
      if (!updatedAnswers.containsKey(question.id)) {
        updatedAnswers[question.id] = ""; // Marcar como incorrecta
      }
    }

    state = state.copyWith(
      userAnswers: updatedAnswers,
      isExamFinished: true,
      isTimeOver: true,
    );
  }

  void finishExamEarly() {
    final updatedAnswers = Map<String, String>.from(state.userAnswers);

    // Marcar preguntas no respondidas como vacías
    for (final question in state.questions) {
      if (!updatedAnswers.containsKey(question.id)) {
        updatedAnswers[question.id] = "";
      }
    }

    state = state.copyWith(
      userAnswers: updatedAnswers,
      isExamFinished: true,
    );
  }

  void resetExamState() {
    state = ExamState(
      questions: state.questions,
      userAnswers: {},
      currentQuestionIndex: 0,
      isExamFinished: false,
      isTimeOver: false,
    );
  }
}
