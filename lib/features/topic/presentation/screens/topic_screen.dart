import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/widgets/item_topic_widget.dart';

class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopicUseCase = ref.read(getTopicUseCaseProvider);
    final levelId = ref.watch(levelIdProvider);
    final module = ref.watch(moduleProvider);

    return FutureBuilder<List<TopicModel>>(
        future: listTopicUseCase.call(levelId, module),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron niveles.'));
          }

          final topicList = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Choose topic list',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              //backgroundColor: const Color.fromARGB(255, 64, 64, 64),
              centerTitle: true,
              foregroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: topicList.length,
                itemBuilder: (context, index) {
                  final topic = topicList[index];
                  return ItemTopicWidget(topic: topic);
                },
              ),
            ),
          );
        });
  }
}
