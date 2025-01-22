import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/core/theme/theme_manager.dart';
import 'package:ruta_flutter/core/theme/theme_notifier.dart';
import 'package:ruta_flutter/features/loading/loading_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
