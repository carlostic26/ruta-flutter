import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/data/models/level_model.dart';
import 'package:ruta_flutter/features/home/data/repositories/home_repository_impl.dart';
import 'package:ruta_flutter/features/home/domain/repositories/level_repository.dart';
import 'package:ruta_flutter/features/home/domain/use_cases/get_level_use_case.dart';

// Proveedor del repositorio
final todoRepositoryProvider = Provider<LevelRepository>((ref) {
  return LevelRepositoryImpl();
});

final moduleProvider = StateProvider((ref) => 'Jr');

// Proveedor de los casos de uso
final getLevelUseCaseProvider = Provider<GetLevelUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetLevelUseCase(repository);
});

final levelListProvider =
    StateNotifierProvider<LevelListNotifier, List<LevelModel>>((ref) {
  final getLevelUseCase = ref.read(getLevelUseCaseProvider);
  return LevelListNotifier(getLevelUseCase);
});

class LevelListNotifier extends StateNotifier<List<LevelModel>> {
  final GetLevelUseCase getLevelUseCase;

  LevelListNotifier(this.getLevelUseCase) : super([]) {
    //TODO: recibir el provider moduleProvider en lugar de 'Jr'
    _getLevels('Jr');
  }

  Future<void> _getLevels(String module) async {
    final levels = await getLevelUseCase(module);
    state = levels;
  }
}
