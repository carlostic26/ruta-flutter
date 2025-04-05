import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/common/domain/services/reset_app_service.dart';
import 'package:ruta_flutter/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/progress/data/datasources/progress_local_database.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/completed_subtopic_state_notifier.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ResetServiceImpl implements ResetService {
  final ProgressRepository progressRepository;
  final SharedPreferences sharedPreferences;
  final Ref ref;

  ResetServiceImpl({
    required this.progressRepository,
    required this.sharedPreferences,
    required this.ref,
  });

  final ProgressLocalDatabaseHelper _dbHelper = ProgressLocalDatabaseHelper();

  Future<Database> get progressLocalDatabase async =>
      await _dbHelper.getDatabase();

  @override
  Future<void> resetAllUserProgress() async {
    _resetSharedPreferences();
    _resetProgressDatabase();
    _resetProviders();
  }

  void _resetSharedPreferences() async {
    // 1. Guardamos el valor de 'firstWelcome' antes de limpiar
    final bool? firstWelcomeValue = sharedPreferences.getBool('firstWelcome');

    // 2. Limpieza completa de SharedPreferences
    await sharedPreferences.clear();

    // 3. Restauramos 'firstWelcome' si existía
    if (firstWelcomeValue != null) {
      await sharedPreferences.setBool('firstWelcome', firstWelcomeValue);
    }
  }

  Future<void> _resetProgressDatabase() async {
    final db = await progressLocalDatabase;

    await db.delete('progress');
  }

  Future<void> _resetProviders() async {
    await _resetStateNotifiers();
    ref.read(actualModuleProvider.notifier).state = 'Jr';
    await _invalidateProviders();
  }

  Future<void> _resetStateNotifiers() async {
    await Future.wait([
      ref.read(completedLevelsProvider.notifier).clear(),
      ref.read(completedTopicsProvider.notifier).reset(),
      ref.read(completedSubtopicsProvider.notifier).reset(),
    ]);
  }

  Future<void> _invalidateProviders() async {
    final List<ProviderOrFamily> providersToInvalidate = [
      getLevelUseCaseProvider,
      completedTopicsProvider,
      completedSubtopicsProvider,
      isTopicCompletedUseCaseProvider,
      isSubtopicCompletedUseCaseProvider,
      getUserTotalScoreByModuleUseCaseProvider,
      getScoresByModuleProvider,
      getTotalScoreByLevelProvider,
      getSubtopicUseCaseProvider,
      getTopicUseCaseProvider,
    ];

    // 2. Invalidación segura
    for (final provider in providersToInvalidate) {
      ref.invalidate(provider);
    }
  }
}
