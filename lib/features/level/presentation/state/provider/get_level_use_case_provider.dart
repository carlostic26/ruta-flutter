import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/data/repositories/level_repository_impl.dart';
import 'package:ruta_flutter/features/level/domain/repositories/level_repository.dart';
import 'package:ruta_flutter/features/level/domain/use_cases/get_level_use_case.dart';

// Proveedor del repositorio de los casos de uso
final levelRepositoryProvider = Provider<LevelRepository>((ref) {
  return LevelRepositoryImpl();
});

// Proveedor del módulo seleccionado
final moduleProvider = StateProvider<String>((ref) => 'Jr');

final levelIdProvider = StateProvider<int>((ref) => 0);

final levelTitleProvider = StateProvider<String>((ref) => '');

// Proveedor del caso de uso (Inyección de dependencias)
final getLevelUseCaseProvider = Provider<GetLevelUseCase>((ref) {
  final repository = ref.read(levelRepositoryProvider);
  return GetLevelUseCase(repository);
});
