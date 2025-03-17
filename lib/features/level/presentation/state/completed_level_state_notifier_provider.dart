import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

// StateNotifier para manejar los niveles completados
class CompletedLevelsNotifier extends StateNotifier<List<int>> {
  final ProgressRepository _repository;

  CompletedLevelsNotifier(this._repository) : super([]) {
    _loadCompletedLevels();
  }

  // Cargar los niveles completados
  Future<void> _loadCompletedLevels() async {
    final completedLevels = await _repository.getAllCompletedLevels();
    state = completedLevels;
  }

  // Verificar y actualizar si un nivel está completado
  Future<void> checkAndUpdateLevelCompletion(int levelId, String module) async {
    // Verificar si todos los topics del nivel están completados
    final isCompleted = await _repository.isLevelCompleted(module, levelId);

    // Actualizar el estado solo si es necesario
    if (isCompleted && !state.contains(levelId)) {
      state = [...state, levelId]; // Marcar el nivel como completado
    } else if (!isCompleted && state.contains(levelId)) {
      state = state
          .where((id) => id != levelId)
          .toList(); // Remover el nivel si ya no está completado
    }

    print("Verificando nivel $levelId: ¿Completado? $isCompleted");
  }
}

// Proveedor para el StateNotifier de niveles completados
final completedLevelsProvider =
    StateNotifierProvider<CompletedLevelsNotifier, List<int>>((ref) {
  final progressRepository = ref.read(progressRepositoryProvider);
  return CompletedLevelsNotifier(progressRepository);
});
