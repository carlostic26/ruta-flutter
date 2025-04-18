import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutas_flutter/features/topic/data/model/topic_model.dart';
import 'package:rutas_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutas_flutter/features/topic/presentation/widgets/item_topic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopicUseCase = ref.read(getTopicUseCaseProvider);
    final levelId = ref.watch(actualLevelIdProvider);
    final module = ref.watch(actualModuleProvider);
    final levelTitle = ref.watch(levelTitleProvider);

/*     // Validación del módulo
    final normalizedModule = module;
    if (!['jr', 'mid', 'sr'].contains(normalizedModule)) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Center(
          child: Text('Módulo no válido. Por favor selecciona otro.'),
        ),
      );
    }
 */
    // Obtener los topics completados según el módulo
    final completedTopics = switch (module) {
      'Jr' => ref.watch(jrCompletedTopicsProvider),
      'Mid' => ref.watch(midCompletedTopicsProvider),
      'Sr' => ref.watch(srCompletedTopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };

    return FutureBuilder<List<TopicModel>>(
      future: listTopicUseCase.call(levelId, module),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron topics.'));
        }

        final topicList = snapshot.data!;

        final activeStep = topicList
            .where((topic) => completedTopics.contains(topic.id))
            .length;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              levelTitle.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stepper Vertical
                SizedBox(
                  width: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EasyStepper(
                        alignment: Alignment.topLeft,
                        lineStyle: const LineStyle(
                          lineLength: 20,
                          lineThickness: 1,
                          lineType: LineType.dotted,
                        ),
                        activeStepBackgroundColor: Colors.grey,
                        finishedStepBackgroundColor: Colors.green,
                        stepRadius: 10,
                        activeStep: activeStep,
                        enableStepTapping: false,
                        direction: Axis.vertical,
                        steps: _buildSteps(topicList, completedTopics),
                        onStepReached: (index) {},
                      )
                    ],
                  ),
                ),
                // Lista de Topics
                Expanded(
                  child: ListView.builder(
                    itemCount: topicList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 28),
                        child: ItemTopicWidget(
                          topic: topicList[index],
                          module: module,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<EasyStep> _buildSteps(
      List<TopicModel> topics, List<String> completedTopics) {
    return topics.map((topic) {
      final isCompleted = completedTopics.contains(topic.id);
      return EasyStep(
        icon: Icon(
          Icons.check,
          size: 20,
          color: isCompleted ? Colors.white : Colors.grey,
        ),
        activeIcon: const Icon(Icons.check, size: 20, color: Colors.white),
        finishIcon: const Icon(Icons.check, size: 20, color: Colors.white),
      );
    }).toList();
  }
}
