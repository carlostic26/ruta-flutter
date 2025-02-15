import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/data/models/level_model.dart';
import 'package:ruta_flutter/features/home/data/repositories/home_repository_impl.dart';
import 'package:ruta_flutter/features/home/domain/repositories/level_repository.dart';
import 'package:ruta_flutter/features/home/domain/use_cases/get_level_use_case.dart';

// Proveedor del repositorio que vamos a usar en los casos de uso
final levelRepositoryProvider = Provider<LevelRepository>((ref) {
  return LevelRepositoryImpl();
});

// Proveedor del módulo seleccionado
final moduleProvider = StateProvider<String>((ref) => 'Jr');

final levelIdProvider = StateProvider<int>((ref) => 0);

// Proveedor del caso de uso (Inyección de dependencias)
final getLevelUseCaseProvider = Provider<GetLevelUseCase>((ref) {
  final repository = ref.read(levelRepositoryProvider);
  return GetLevelUseCase(repository);
});


/* 
// Este proveedor permitirá que el widget que contruya los niveles, pueda leer la información de todos ellos.
final levelListProvider =
    StateNotifierProvider<LevelListNotifier, List<LevelModel>>((ref) {
  final getLevelUseCase = ref.read(getLevelUseCaseProvider);
  final notifier = LevelListNotifier(getLevelUseCase);

/*   // 🔥 Escuchar cambios en moduleProvider y actualizar la lista automáticamente
  ref.listen<String>(moduleProvider, (previous, next) {
    notifier.loadLevels(next);
  }); */

  return notifier;
});

// StateNotifier optimizado
class LevelListNotifier extends StateNotifier<List<LevelModel>> {
  final GetLevelUseCase loadLevelUseCase;

  LevelListNotifier(this.loadLevelUseCase) : super([]) {
    loadLevels('Jr'); // Cargar niveles iniciales
  }

  Future<void> loadLevels(String module) async {
    final levels = await loadLevelUseCase(module);
    state = levels;
  }
}
 */