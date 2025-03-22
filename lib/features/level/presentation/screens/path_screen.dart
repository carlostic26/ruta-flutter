import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/level/presentation/state/shared_preferences_provider.dart';
import 'package:ruta_flutter/features/level/presentation/widgets/generate_route_path_widget.dart';
import 'package:ruta_flutter/features/progress/presentation/screens/progres_score_screen.dart';

class PathScreen extends ConsumerWidget {
  const PathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLevel = ref.watch(moduleProvider);

    // Observar el estado de completedLevelsProvider para forzar la reconstrucción
    ref.watch(completedLevelsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ruta $selectedLevel',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.5,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProgressScoreScreen()),
              );
            },
          ),
        ],
      ),
      body:
          const GenerateLevelsRoutePathWidget(), // Este widget se reconstruirá cuando completedLevels cambie
      bottomNavigationBar: const SizedBox(height: 80, child: Placeholder()),
    );
  }
}
