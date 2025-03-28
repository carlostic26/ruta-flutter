import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/presentation/screens/detail_screen.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/completed_subtopic_state_notifier.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';

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
    final isCompleted =
        ref.watch(completedSubtopicsProvider).contains(subtopic.id);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          // Navegar a la pantalla de detalles
          ref.read(subtopicIdProvider.notifier).state = subtopic.id!;
          ref.read(titleSubtopicProvider.notifier).state = subtopic.title!;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailScreen()),
          );
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
