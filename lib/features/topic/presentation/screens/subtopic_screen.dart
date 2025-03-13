import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/progress/presentation/state/progress_widget_notifier.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
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
    final isSubtopicCompletedUseCase =
        ref.read(isSubtopicCompletedUseCaseProvider);
    final completedSubtopics = ref.watch(progressNotifierProvider);

    // Usar completedSubtopics para evitar la advertencia
    // Esto asegura que el widget se reconstruya cuando el progreso cambie
    final _ = completedSubtopics;

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
                SizedBox(
                  width: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<bool>>(
                        future: Future.wait(
                          subtopicList
                              .map((subtopic) =>
                                  isSubtopicCompletedUseCase.call(subtopic.id!))
                              .toList(),
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
                            finishedStepBackgroundColor:
                                Colors.green, // Color de los steps completados
                            stepRadius: 8,
                            activeStep: completedSteps.lastIndexOf(true) + 1,
                            enableStepTapping: false,
                            direction: Axis.vertical,
                            steps: List.generate(
                              subtopicList.length,
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
                // Lista de Subtopics
                Expanded(
                  child: ListView.builder(
                    itemCount: subtopicList.length,
                    itemBuilder: (context, index) {
                      final subtopic = subtopicList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 20),
                        child: ItemSubtopicWidget(subtopic: subtopic),
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
