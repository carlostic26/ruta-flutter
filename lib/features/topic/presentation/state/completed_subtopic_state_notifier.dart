import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/data/repository/progress_repository_impl.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';

//Este provider notifica al steper cualquier cambio que haya respecto al registro de un subtopic. Mostrará cambios en tiempo real en pantalla, para evitar el problema de tener que volver a estrar a subtopic screen para ver el steper completado.

//Se hace uso el progressRepository para que la notificacion de subtopic completed persista en el tiempo
class CompletedSubtopicsNotifier extends StateNotifier<List<String>> {
  final ProgressRepository _repository;

  CompletedSubtopicsNotifier(this._repository) : super([]) {
    _loadCompletedSubtopics();
  }

  Future<void> _loadCompletedSubtopics() async {
    final completedSubtopics = await _repository.getAllCompletedSubtopics();
    state = completedSubtopics;
  }

  void markSubtopicAsCompleted(String subtopicId) {
    if (!state.contains(subtopicId)) {
      state = [...state, subtopicId];
    }
  }
}

// Proveedor para el repositorio de progreso
final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final subtopicRepository = ref.read(subtopicRepositoryProvider);
  final topicRepository = ref.read(topicRepositoryProvider);
  return ProgressRepositoryImpl(subtopicRepository, topicRepository);
});

// Proveedor para el StateNotifier de subtopics completados
final completedSubtopicsProvider =
    StateNotifierProvider<CompletedSubtopicsNotifier, List<String>>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return CompletedSubtopicsNotifier(repository);
});
