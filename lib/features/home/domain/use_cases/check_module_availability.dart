// lib/features/home/domain/use_cases/check_module_availability.dart
import 'package:ruta_flutter/core/services/shared_preferences_service.dart';

class CheckModuleAvailability {
  final SharedPreferencesService sharedPreferencesService;

  CheckModuleAvailability(this.sharedPreferencesService);

  Future<bool> isModuleEnabled(String moduleName) async {
    switch (moduleName) {
      case 'jr':
        return true; // El módulo JR siempre está disponible
      case 'md':
        return await sharedPreferencesService.isExamCompleted('jr');
      case 'sr':
        return await sharedPreferencesService.isExamCompleted('md');
      default:
        return false;
    }
  }
}
