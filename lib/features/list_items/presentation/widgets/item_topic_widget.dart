import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutas_flutter/features/list_items/data/model/topic_model.dart';
import 'package:rutas_flutter/features/list_items/presentation/screens/list_items_screen.dart';
import 'package:rutas_flutter/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

class ItemTopicWidget extends ConsumerWidget {
  final TopicModel topic;
  final String module;

  const ItemTopicWidget({
    super.key,
    required this.topic,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener el provider correcto según el módulo
    final List<String> completedTopics = switch (module) {
      'Jr' => ref.watch(jrCompletedTopicsProvider),
      'Mid' => ref.watch(midCompletedTopicsProvider),
      'Sr' => ref.watch(srCompletedTopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };
    final isCompleted = completedTopics.contains(topic.id);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
/*         onTap: () {
          ref.read(topicIdProvider.notifier).state = topic.id!;
          ref.read(topicTitleProvider.notifier).state = topic.title!;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubtopicScreen()),
          );
        }, */
        onTap: () {
          ref.read(topicIdProvider.notifier).state = topic.id!;
          ref.read(topicTitleProvider.notifier).state = topic.title!;
          ref.read(currentPageProvider.notifier).state = 1;
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
                topic.title!,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
