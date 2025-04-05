import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/completed_level_state_notifier_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferencesProvider should be overridden');
});

final completedLevelsProvider =
    StateNotifierProvider<CompletedLevelsNotifier, List<int>>((ref) {
  final progressRepository = ref.read(progressRepositoryProvider);
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return CompletedLevelsNotifier(progressRepository, sharedPreferences);
});
