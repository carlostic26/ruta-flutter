import 'package:ruta_flutter/features/progress/data/model/progress_model.dart';

abstract class ProgressRepository {
  Future<void> createProgressBySubtopic({
    required String module,
    required int levelId,
    required String topicId,
    required String subtopicId,
    required int score,
  });

  Future<List<ProgressModel>> getAllModuleProgress(String module);

  Future<List<ProgressModel>> getAllLevelProgressByModule({
    required String module,
    required int levelId,
  });

  Future<List<ProgressModel>> getAllTopicProgressByModule({
    required String module,
    required int levelId,
    required String topicId,
  });

  Future<bool> isSubtopicCompleted(String subtopicId);
  Future<bool> isTopicCompleted(String module, int levelId, String topicId);

  Future<List<int>> getScoresByModule(String module);

  Future<int> getTotalScoreByLevelOfModule({
    required String module,
    required int levelId,
  });

  Future<int> getTotalSubtopicsByLevel({
    required String module,
    required int level,
  });

  Future<int> getCompletedSubtopicsByLevel({
    required String module,
    required int level,
  });
}
