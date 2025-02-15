import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/topic_repository.dart';

class GetTopicUseCase {
  late final TopicRepository repository;

  GetTopicUseCase(this.repository);

  Future<List<TopicModel>> call(int levelId) async {
    return repository.getTopics(levelId);
  }
}
