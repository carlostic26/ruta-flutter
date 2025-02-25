import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/topic/data/repositories/subtopic_repository_impl.dart';
import 'package:ruta_flutter/features/topic/domain/repositories/subtopic_repository.dart';
import 'package:ruta_flutter/features/topic/domain/use_cases/get_subtopic_use_case.dart';

// Proveedor del repositorio que vamos a usar en los casos de uso
final subtopicRepositoryProvider = Provider<SubtopicRepository>((ref) {
  return SubtopicRepositoryImpl();
});

// Proveedor del titulo de subtopic seleccionado
final titleTopicProvider = StateProvider<String>((ref) => '');
//TODO: insertar el estado (titulo de subtopic) cuando el usuario haga click en continuar dentro del dialogo del path.

// Proveedor del caso de uso (Inyección de dependencias)
final getSubtopicUseCaseProvider = Provider<GetSubtopicUseCase>((ref) {
  final repository = ref.read(subtopicRepositoryProvider);
  return GetSubtopicUseCase(repository);
});
