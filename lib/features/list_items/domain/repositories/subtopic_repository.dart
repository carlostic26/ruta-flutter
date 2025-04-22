import 'package:rutas_flutter/features/list_items/data/model/subtopic_model.dart';

abstract class SubtopicRepository {
  Future<List<SubtopicModel>> getSubtopics(String topicID, String module);
}
