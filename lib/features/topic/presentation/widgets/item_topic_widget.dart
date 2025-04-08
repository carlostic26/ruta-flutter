import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/subtopic_screen.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart'; // Asegúrate de importar el provider de progreso

class ItemTopicWidget extends ConsumerWidget {
  final TopicModel topic;

  const ItemTopicWidget({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener la lista de topics completados
    final completedTopics = ref.watch(completedTopicsProviderByModule);

    // Determinar si el topic actual está completado
    final isCompleted = completedTopics.contains(topic.id);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          ref.read(topicIdProvider.notifier).state = topic.id!;
          ref.read(topicTitleProvider.notifier).state = topic.title!;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubtopicScreen()),
          );
        },
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green
                : const Color(0xFF2962FF), // Cambiar color basado en el estado
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
