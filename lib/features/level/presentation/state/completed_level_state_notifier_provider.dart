import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedLevelsNotifier extends StateNotifier<List<int>> {
  final ProgressRepository _repository;
  final SharedPreferences _sharedPreferences;

  CompletedLevelsNotifier(this._repository, this._sharedPreferences)
      : super([]) {
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
      await _sharedPreferences.setInt(
          'lastCompletedLevel', levelId); // Guardar el último nivel completado
    } else if (!isCompleted && state.contains(levelId)) {
      state = state
          .where((id) => id != levelId)
          .toList(); // Remover el nivel si ya no está completado
    }

    print("Verificando nivel $levelId: ¿Completado? $isCompleted");
  }

  // Obtener el último nivel completado
  int? getLastCompletedLevel() {
    return _sharedPreferences.getInt('lastCompletedLevel');
  }

  // Limpiar el último nivel completado
  Future<void> clearLastCompletedLevel() async {
    await _sharedPreferences.remove('lastCompletedLevel');
  }
}
