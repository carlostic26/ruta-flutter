import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/home/presentation/widgets/generate_route_path_widget.dart';

class PathScreen extends ConsumerWidget {
  const PathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLevel = ref.watch(moduleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ruta $selectedLevel',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const GenerateRoutePathWidget(),
      bottomNavigationBar: const SizedBox(height: 80, child: Placeholder()),
    );
  }
}
