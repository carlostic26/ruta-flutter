import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/final_exam/domain/entities/exam_question.dart';

class QuestionWidget extends StatelessWidget {
  final ExamQuestion question;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;

  const QuestionWidget({
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pregunta (más grande y en bold)
          Container(
            height: screenHeight * 0.22,
            width: screenWidth,
            decoration: BoxDecoration(
              color: const Color.fromARGB(173, 66, 66, 66),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Text(
                question.questionText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Opciones de respuesta
          ...question.options.map((option) {
            return Container(
              margin:
                  const EdgeInsets.only(bottom: 10), // Espacio entre opciones
              decoration: BoxDecoration(
                color: selectedAnswer == option
                    ? Colors.blue
                        .withOpacity(0.2) // Fondo azul si está seleccionada
                    : Colors
                        .transparent, // Sin color de fondo si no está seleccionada
                border: Border.all(
                  color: Colors.grey, // Color del borde
                  width: 1.0, // Grosor del borde
                ),
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
              ),
              child: RadioListTile<String>(
                title: Text(
                  option,
                  style: const TextStyle(fontSize: 16),
                ),
                value: option,
                groupValue: selectedAnswer,
                onChanged: (value) {
                  onAnswerSelected(value!);
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, // Radio a la derecha
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16), // Padding interno
                tileColor: Colors.transparent, // Sin color de fondo
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
