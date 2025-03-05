import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/widgets/item_subtopic_widget.dart';

class SubtopicScreen extends ConsumerWidget {
  const SubtopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSubtopicUseCase = ref.watch(getSubtopicUseCaseProvider);
    final topicId = ref.watch(topicIdProvider);
    final titleTopic = ref.watch(topicTitleProvider);
    final module = ref.watch(moduleProvider);

    return FutureBuilder<List<SubtopicModel>>(
      future: listSubtopicUseCase.call(topicId, module),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron subtemas.'));
        }

        final subtopicList = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              titleTopic.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: subtopicList.length,
              itemBuilder: (context, index) {
                final subtopic = subtopicList[index];
                return ItemSubtopicWidget(subtopic: subtopic);
              },
            ),
          ),
        );
      },
    );
  }
}
