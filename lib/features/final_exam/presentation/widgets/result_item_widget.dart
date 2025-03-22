import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';

class ResultItemWidget extends StatelessWidget {
  final ExamQuestion question;
  final String? userAnswer;

  const ResultItemWidget({
    required this.question,
    required this.userAnswer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.questionText),
            ...question.options.map((option) {
              final isCorrect = option == question.correctAnswer;
              final isUserAnswer = option == userAnswer;
              return ListTile(
                title: Text(option),
                tileColor: isCorrect
                    ? Colors.green[100]
                    : isUserAnswer
                        ? Colors.red[100]
                        : null,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
