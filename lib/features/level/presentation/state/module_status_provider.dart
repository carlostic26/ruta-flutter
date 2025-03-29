import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/data/models/level_model.dart';
import 'package:ruta_flutter/features/level/presentation/state/shared_preferences_provider.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';

final cachedLevelsProvider =
    FutureProvider.family<List<LevelModel>, String>((ref, module) async {
  final getLevelUseCase = ref.read(getLevelUseCaseProvider);
  return getLevelUseCase.call(module);
});

// Actualizamos los providers de estado del módulo para usar el caché
final jrModuleStatusProvider = FutureProvider<bool>((ref) async {
  final completedLevels = ref.watch(completedLevelsProvider);
  final jrLevelsAsync = ref.watch(cachedLevelsProvider('Jr'));

  return jrLevelsAsync.when(
    loading: () => false,
    error: (_, __) => false,
    data: (levels) {
      final levelNumbers = levels.map((level) => level.order).toList();
      return levelNumbers.every((level) => completedLevels.contains(level));
    },
  );
});

final middleModuleStatusProvider = FutureProvider<bool>((ref) async {
  final completedLevels = ref.watch(completedLevelsProvider);
  final midLevelsAsync = ref.watch(cachedLevelsProvider('Mid'));

  return midLevelsAsync.when(
    loading: () => false,
    error: (_, __) => false,
    data: (levels) {
      final levelNumbers = levels.map((level) => level.order).toList();
      return levelNumbers.every((level) => completedLevels.contains(level));
    },
  );
});
