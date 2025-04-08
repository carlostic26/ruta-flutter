import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/core/providers/shared_preferences_provider.dart';

final moduleStateProvider = FutureProvider<Map<String, bool>>((ref) async {
  final isInitialized = ref.read(sharedPreferencesInitializedProvider);
  if (!isInitialized) {
    throw Exception('SharedPreferencesServiceProvider not initialized');
  }

  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);

  final isJrCompleted = await sharedPreferencesService.isExamCompleted('jr');
  final isMidCompleted = await sharedPreferencesService.isExamCompleted('mid');
  final isSrCompleted = await sharedPreferencesService.isExamCompleted('sr');

  return {
    'jr': true, // El módulo Jr siempre está habilitado
    'mid': isJrCompleted, // Mid depende de Jr
    'sr': isMidCompleted, // Sr depende de Mid
  };
});
