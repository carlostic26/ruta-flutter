import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/topic/data/repositories/subtopic_repository_impl.dart';
import 'package:rutas_flutter/features/topic/domain/repositories/subtopic_repository.dart';
import 'package:rutas_flutter/features/topic/domain/use_cases/get_subtopic_use_case.dart';

// Proveedor del repositorio que vamos a usar en los casos de uso
final subtopicRepositoryProvider = Provider<SubtopicRepository>((ref) {
  return SubtopicRepositoryImpl();
});

// Proveedor del titulo de subtopic seleccionado
final titleSubtopicProvider = StateProvider<String>((ref) => '');
final subtopicIdProvider = StateProvider<String>((ref) => '');

// Proveedor del caso de uso (Inyección de dependencias)
final getSubtopicUseCaseProvider = Provider<GetSubtopicUseCase>((ref) {
  final repository = ref.read(subtopicRepositoryProvider);
  return GetSubtopicUseCase(repository);
});
