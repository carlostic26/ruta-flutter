import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/progress/domain/use_cases/is_subtopic_completed_use_case.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/completed_subtopic_state_notifier.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/widgets/item_subtopic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

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

                StepperWidget(subtopicList: subtopicList),

                // Lista de Subtopics
                Expanded(
                  child: Stack(children: [
                    /*       Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3, right: 20),
                          child: StepperWidget(
                            subtopicList: subtopicList,
                          ),
                        )), */
                    ListView.builder(
                      itemCount: subtopicList.length,
                      itemBuilder: (context, index) {
                        final subtopic = subtopicList[index];

                        return Padding(
                            padding:
                                const EdgeInsets.only(top: 5, bottom: 22.3),
                            child: ItemSubtopicWidget(
                              subtopic: subtopic,
                              index: index,
                            ));
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StepperWidget extends ConsumerWidget {
  final List<SubtopicModel> subtopicList;

  const StepperWidget({
    super.key,
    required this.subtopicList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedSubtopics = ref.watch(completedSubtopicsProvider);

    return SizedBox(
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
            stepRadius: 8,
            activeStep: _getActiveStep(completedSubtopics, subtopicList),
            enableStepTapping: false,
            direction: Axis.vertical,
            steps: List.generate(
              subtopicList.length,
              (index) {
                final subtopic = subtopicList[index];
                final isCompleted = completedSubtopics.contains(subtopic.id);

                return EasyStep(
                  icon: isCompleted
                      ? const Icon(Icons.check, size: 20, color: Colors.white)
                      : const Icon(Icons.check, size: 20, color: Colors.grey),
                  activeIcon:
                      const Icon(Icons.check, size: 20, color: Colors.white),
                  finishIcon:
                      const Icon(Icons.check, size: 20, color: Colors.white),
                );
              },
            ),
            onStepReached: (index) {},
          ),
        ],
      ),
    );
  }

  int _getActiveStep(
      List<String> completedSteps, List<SubtopicModel> subtopicList) {
    for (int i = 0; i < subtopicList.length; i++) {
      if (!completedSteps.contains(subtopicList[i].id)) {
        return i;
      }
    }
    return subtopicList.length;
  }
}
