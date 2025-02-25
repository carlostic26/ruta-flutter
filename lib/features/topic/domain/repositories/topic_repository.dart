import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';

abstract class TopicRepository {
  Future<List<TopicModel>> getTopics(int levelId, String module);
}
