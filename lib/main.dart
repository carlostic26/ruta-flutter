import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/core/database/database_helper.dart';
import 'package:ruta_flutter/core/theme/theme_manager.dart';
import 'package:ruta_flutter/core/theme/theme_notifier.dart';
import 'package:ruta_flutter/features/level/presentation/state/shared_preferences_provider.dart';
import 'package:ruta_flutter/features/loading/presentation/screens/loading_screen.dart';
import 'package:ruta_flutter/features/progress/data/datasources/progress_local_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDatabaseHelper().getDatabase();
  ProgressLocalDatabaseHelper().getDatabase;
  // Inicializar SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      // Sobrescribir el SharedPreferencesProvider con la instancia de SharedPreferences
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ruta Flutter',
        theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
        home: const LoadingScreen());
  }
}
