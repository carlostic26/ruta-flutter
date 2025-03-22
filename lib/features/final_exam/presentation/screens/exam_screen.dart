import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/final_exam/presentation/state/provider/exam_providers.dart';
import '../widgets/question_widget.dart';
import '../widgets/timer_widget.dart';
import '../widgets/progress_widget.dart';

class ExamScreen extends ConsumerStatefulWidget {
  final String moduleId;

  const ExamScreen({required this.moduleId, super.key});

  @override
  ConsumerState<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends ConsumerState<ExamScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    ref.read(examStateProvider.notifier).loadQuestions(widget.moduleId);
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Examen Final')),
      body: Column(
        children: [
          TimerWidget(
              duration: examState.questions.length * 20), // 20 seg por pregunta
          ProgressWidget(
            currentIndex: examState.currentQuestionIndex,
            totalQuestions: examState.questions.length,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: examState.questions.length,
              itemBuilder: (context, index) {
                final question = examState.questions[index];
                return QuestionWidget(
                  question: question,
                  onAnswerSelected: (answer) {
                    ref
                        .read(examStateProvider.notifier)
                        .saveAnswer(question.id, answer);
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(examStateProvider.notifier).nextQuestion();
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
