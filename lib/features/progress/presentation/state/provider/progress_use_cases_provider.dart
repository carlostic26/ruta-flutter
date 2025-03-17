import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/data/repository/progress_repository_impl.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/create_progress_by_subtopic_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_level_progress_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_scores_progress_by_module_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_total_score_by_level.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/is_subtopic_completed_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/is_topic_completed_use_case.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';

// Proveedor del repositorio de progreso
final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final subtopicRepository = ref.read(subtopicRepositoryProvider);
  final topicRepository = ref.read(topicRepositoryProvider);
  return ProgressRepositoryImpl(subtopicRepository, topicRepository);
});

// Proveedor de los casos de uso
final createProgressBySubtopicUseCaseProvider =
    Provider<CreateProgressBySubtopicUseCase>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return CreateProgressBySubtopicUseCase(repository);
});

final isSubtopicCompletedUseCaseProvider = Provider<IsSubtopicCompletedUseCase>(
  (ref) => IsSubtopicCompletedUseCase(ref.read(progressRepositoryProvider)),
);

final isTopicCompletedUseCaseProvider =
    Provider<IsTopicCompletedUseCase>((ref) {
  final progressRepository = ref.read(progressRepositoryProvider);
  return IsTopicCompletedUseCase(progressRepository);
});

// --- Score

final getScoresByModuleProvider = Provider<GetScoresByModule>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return GetScoresByModule(repository);
});

final getTotalScoreByLevelProvider = Provider<GetTotalScoreByLevel>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return GetTotalScoreByLevel(repository);
});

final getLevelProgressProvider = Provider<GetLevelProgress>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return GetLevelProgress(repository);
});

// --- StateNotifier para topics completados

class CompletedTopicsUseCaseNotifier extends StateNotifier<List<String>> {
  final ProgressRepository _repository;

  CompletedTopicsUseCaseNotifier(this._repository) : super([]) {
    _loadCompletedTopics();
  }

  Future<void> _loadCompletedTopics() async {
    final completedTopics = await _repository.getAllCompletedTopics();
    state = completedTopics;
  }

  Future<void> checkAndUpdateTopicCompletion(
      String topicId, String module, int levelId) async {
    final isCompleted =
        await _repository.isTopicCompleted(module, levelId, topicId);

    if (isCompleted && !state.contains(topicId)) {
      state = [...state, topicId]; // Marcar el topic como completado
    } else if (!isCompleted && state.contains(topicId)) {
      state = state
          .where((id) => id != topicId)
          .toList(); // Remover el topic si ya no está completado
    }

    print(
        "Verificando topic en progress use case provider $topicId: ¿Completado? $isCompleted");
  }
}

// Proveedor para el StateNotifier de topics completados
final completedTopicsProvider =
    StateNotifierProvider<CompletedTopicsUseCaseNotifier, List<String>>((ref) {
  final progressRepository = ref.read(progressRepositoryProvider);
  return CompletedTopicsUseCaseNotifier(progressRepository);
});
