import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:ruta_flutter/features/final_exam/presentation/state/provider/exam_providers.dart';
import '../widgets/result_item_widget.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  const ResultsScreen({super.key});

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  late Future<bool> _loadingFuture;
  int _correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    _loadingFuture = _calculateResults();
  }

  Future<bool> _calculateResults() async {
    await Future.delayed(const Duration(seconds: 4));
    final examState = ref.read(examStateProvider);
    _correctAnswersCount = examState.userAnswers.entries.where((entry) {
      final question = examState.questions.firstWhere(
        (q) => q.id == entry.key,
        orElse: () => throw Exception("Pregunta no encontrada"),
      );
      return entry.value == question.correctAnswer;
    }).length;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examStateProvider);
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultados',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            ref.read(examStateProvider.notifier).resetExamState();
            Navigator.pop(context);
          },
        ),
        actions: [
          FutureBuilder(
            future: _loadingFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$_correctAnswersCount/${examState.questions.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: heightScreen * 0.105,
                  child: Lottie.asset(
                    'assets/animations/funny_loading.json',
                    width: widthScreen,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: heightScreen * 0.43, // Ajusta este valor según necesites
                  child: Text(
                    'Calculando tu puntuación...',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: examState.questions.length,
            itemBuilder: (context, index) {
              final question = examState.questions[index];
              final userAnswer = examState.userAnswers[question.id];
              return ResultItemWidget(
                question: question,
                userAnswer: userAnswer,
              );
            },
          );
        },
      ),
    );
  }
}
