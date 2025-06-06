import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/list_items/presentation/screens/list_items_screen.dart';
import 'package:rutas_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutas_flutter/features/list_items/data/model/subtopic_model.dart';
import 'package:rutas_flutter/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';

class ItemSubtopicWidget extends ConsumerWidget {
  final SubtopicModel subtopic;
  final int index;

  const ItemSubtopicWidget({
    super.key,
    required this.subtopic,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener el módulo actual
    final module = ref.watch(actualModuleProvider);

    // Seleccionar el provider correcto según el módulo
    final completedSubtopics = switch (module) {
      'Jr' => ref.watch(jrCompletedSubtopicsProvider),
      'Mid' => ref.watch(midCompletedSubtopicsProvider),
      'Sr' => ref.watch(srCompletedSubtopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };

    final isCompleted = completedSubtopics.contains(subtopic.id);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          // Navegar a la pantalla de detalles
          ref.read(subtopicIdProvider.notifier).state = subtopic.id!;
          ref.read(titleSubtopicProvider.notifier).state = subtopic.title!;
/*           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailScreen()),
          ); */

          // En algún lugar donde navegas a DetailScreen:
          ref.read(currentPageProvider.notifier).state = 2;
        },
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : const Color(0xFF2962FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtopic.title!,
                style: const TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
