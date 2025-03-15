import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:ruta_flutter/features/topic/data/model/topic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/widgets/item_topic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopicUseCase = ref.read(getTopicUseCaseProvider);
    final levelId = ref.watch(levelIdProvider);
    final module = ref.watch(moduleProvider);
    final levelTitle = ref.watch(levelTitleProvider);
    final completedTopics = ref.watch(completedTopicsProvider);

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
              onPressed: () {
                Navigator.pop(context);
              },
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
                        activeStep: completedTopics.length,
                        enableStepTapping: false,
                        direction: Axis.vertical,
                        steps: List.generate(
                          topicList.length,
                          (index) => EasyStep(
                            icon: completedTopics.contains(topicList[index].id)
                                ? const Icon(Icons.check,
                                    size: 20, color: Colors.white)
                                : const Icon(Icons.check,
                                    size: 20, color: Colors.grey),
                            activeIcon: const Icon(Icons.check,
                                size: 20, color: Colors.white),
                            finishIcon: const Icon(Icons.check,
                                size: 20, color: Colors.white),
                          ),
                        ),
                        onStepReached: (index) {},
                      ),
                    ],
                  ),
                ),

                // Lista de Topics
                Expanded(
                  child: ListView.builder(
                    itemCount: topicList.length,
                    itemBuilder: (context, index) {
                      final topic = topicList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 28),
                        child: ItemTopicWidget(topic: topic),
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
}

/* class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopicUseCase = ref.read(getTopicUseCaseProvider);
    final levelId = ref.watch(levelIdProvider);
    final module = ref.watch(moduleProvider);
    final levelTitle = ref.watch(levelTitleProvider);
    final isTopicCompletedUseCase = ref.read(isTopicCompletedUseCaseProvider);

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
              onPressed: () {
                Navigator.pop(context);
              },
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
                      FutureBuilder<List<bool>>(
                        future: Future.wait(
                          topicList.map((topic) => isTopicCompletedUseCase.call(
                                module,
                                levelId,
                                topic.id!,
                              )),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return const Text('No data');
                          }

                          final completedSteps = snapshot.data!;

                          return EasyStepper(
                            alignment: Alignment.topLeft,
                            lineStyle: const LineStyle(
                              lineLength: 20,
                              lineThickness: 1,
                              lineType: LineType.dotted,
                            ),
                            activeStepBackgroundColor: Colors.grey,
                            finishedStepBackgroundColor: Colors.green,
                            stepRadius: 10,
                            activeStep: completedSteps.lastIndexOf(true) + 1,
                            enableStepTapping: false,
                            direction: Axis.vertical,
                            steps: List.generate(
                              topicList.length,
                              (index) => EasyStep(
                                icon: completedSteps[index]
                                    ? const Icon(Icons.check,
                                        size: 20, color: Colors.white)
                                    : const Icon(Icons.check,
                                        size: 20, color: Colors.grey),
                                activeIcon: const Icon(Icons.check,
                                    size: 20, color: Colors.white),
                                finishIcon: const Icon(Icons.check,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                            onStepReached: (index) {},
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Lista de Topics
                Expanded(
                  child: ListView.builder(
                    itemCount: topicList.length,
                    itemBuilder: (context, index) {
                      final topic = topicList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 28),
                        child: ItemTopicWidget(topic: topic),
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
}
 */