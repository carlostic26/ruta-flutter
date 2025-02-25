import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/topic/data/repositories/topic_repository_impl.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/topic_repository.dart';
import 'package:ruta_flutter/features/topic/domain/use_cases/get_topic_use_case.dart';

// Proveedor del repositorio que vamos a usar en los casos de uso
final topicRepositoryProvider = Provider<TopicRepository>((ref) {
  return TopicRepositoryImpl();
});

// Proveedor del titulo de topic seleccionado
final titleTopicProvider = StateProvider<String>((ref) => '');
//TODO: insertar el estado (titulo de nivel) cuando el usuario haga click en continuar dentro del dialogo del path.

final topicIdProvider = StateProvider<String>((ref) => '');

// Proveedor del caso de uso (Inyección de dependencias)
final getTopicUseCaseProvider = Provider<GetTopicUseCase>((ref) {
  final repository = ref.read(topicRepositoryProvider);
  return GetTopicUseCase(repository);
});
