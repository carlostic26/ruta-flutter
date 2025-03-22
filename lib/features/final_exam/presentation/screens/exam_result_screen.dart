import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/final_exam/presentation/state/provider/exam_providers.dart';
import '../widgets/result_item_widget.dart';

class ExamResultScreen extends ConsumerWidget {
  const ExamResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: ListView.builder(
        itemCount: examState.questions.length,
        itemBuilder: (context, index) {
          final question = examState.questions[index];
          final userAnswer = examState.userAnswers[question.id];
          return ResultItemWidget(
            question: question,
            userAnswer: userAnswer,
          );
        },
      ),
    );
  }
}
