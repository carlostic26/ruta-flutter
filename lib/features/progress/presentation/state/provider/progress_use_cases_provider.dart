import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/data/repository/progress_repository_impl.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/create_progress_by_subtopic_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_all_progress_levels_by_module_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_all_progress_modules_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_all_progress_topics_by_module.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_level_progress_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_scores_progress_by_module_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/get_total_score_by_level.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/is_subtopic_completed_use_case.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/is_topic_completed_use_case.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final subtopicRepository = ref.read(subtopicRepositoryProvider);
  return ProgressRepositoryImpl(subtopicRepository);
});

// Proveedor de los casos de uso
final createProgressBySubtopicUseCaseProvider =
    Provider<CreateProgressBySubtopicUseCase>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return CreateProgressBySubtopicUseCase(repository);
});

final getAllProgressTopicsByModuleUseCaseProvider =
    Provider<GetAllProgressTopicsByModuleUseCase>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return GetAllProgressTopicsByModuleUseCase(repository);
});

final getAllLevelsProgressByModuleUseCaseProvider =
    Provider<GetAllLevelsProgressByModuleUseCase>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return GetAllLevelsProgressByModuleUseCase(repository);
});

final getAllModulesProgressUseCaseProvider =
    Provider<GetAllModulesProgressUseCase>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return GetAllModulesProgressUseCase(repository);
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
