import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/subtopic_screen.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';

class ItemTopicWidget extends ConsumerWidget {
  final TopicModel topic;

  const ItemTopicWidget({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          height: 40,
          width: 400,
          decoration: BoxDecoration(
            color: const Color(0xFF2962FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                topic.title!,
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
