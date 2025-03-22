import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';

class QuestionWidget extends StatelessWidget {
  final ExamQuestion question;
  final Function(String) onAnswerSelected;

  const QuestionWidget({
    required this.question,
    required this.onAnswerSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question.questionText),
        ...question.options.map((option) {
          return RadioListTile(
            title: Text(option),
            value: option,
            groupValue: null, // Aquí puedes manejar la opción seleccionada
            onChanged: (value) {
              onAnswerSelected(value as String);
            },
          );
        }).toList(),
      ],
    );
  }
}
