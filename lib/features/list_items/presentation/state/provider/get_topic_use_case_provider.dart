import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/list_items/data/repositories/topic_repository_impl.dart';
import 'package:rutas_flutter/features/list_items/domain/repositories/topic_repository.dart';
import 'package:rutas_flutter/features/list_items/domain/use_cases/get_topic_use_case.dart';

// Proveedor del repositorio que vamos a usar en los casos de uso
final topicRepositoryProvider = Provider<TopicRepository>((ref) {
  return TopicRepositoryImpl();
});

// Proveedor del titulo de topic seleccionado
final titleTopicProvider = StateProvider<String>((ref) => '');

final topicIdProvider = StateProvider<String>((ref) => '');
final topicTitleProvider = StateProvider<String>((ref) => '');

final getTopicUseCaseProvider = Provider<GetTopicUseCase>((ref) {
  final repository = ref.read(topicRepositoryProvider);
  return GetTopicUseCase(repository);
});
