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
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    ref.read(examStateProvider.notifier).loadQuestions(widget.moduleId);
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examStateProvider);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Si no hay preguntas, mostrar un mensaje
    if (examState.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Examen Final',
          style: TextStyle(fontSize: 16),
        )),
        body: const Center(child: Text('No hay preguntas disponibles.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jr',
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.highlight_off, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: [
              // Barra de progreso
              Container(
                height: 8, // Altura de la barra de progreso
                width: screenWidth * 0.6, // Ancho de la barra de progreso
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Color de fondo de la barra
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                  child: LinearProgressIndicator(
                    value:
                        (examState.currentQuestionIndex + 1) / 15, // Progreso
                    backgroundColor: Colors.transparent, // Fondo transparente
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green), // Color de la barra de progreso
                  ),
                ),
              ),

              // Texto de progreso (ejemplo: 5/10)
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Text(
                  '${examState.currentQuestionIndex + 1}/15',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Espacio en la parte superior para bajar el contenido
              SizedBox(height: screenHeight * 0.1),

              // Pregunta y opciones
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics:
                      const NeverScrollableScrollPhysics(), // Deshabilitar el desplazamiento manual
                  itemCount: examState.questions.length,
                  itemBuilder: (context, index) {
                    final question = examState.questions[index];
                    return QuestionWidget(
                      question: question,
                      selectedAnswer: _selectedAnswer,
                      onAnswerSelected: (answer) {
                        setState(() {
                          _selectedAnswer = answer;
                        });
                      },
                    );
                  },
                ),
              ),
              // Botón "Continuar"
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, screenHeight * 0.16),
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: _selectedAnswer == null
                        ? null
                        : () {
                            ref.read(examStateProvider.notifier).saveAnswer(
                                  examState
                                      .questions[examState.currentQuestionIndex]
                                      .id,
                                  _selectedAnswer!,
                                );
                            ref.read(examStateProvider.notifier).nextQuestion();
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              _selectedAnswer = null; // Reiniciar la selección
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedAnswer == null
                          ? Colors.grey // Color gris cuando está deshabilitado
                          : Colors.blue, // Color azul cuando está habilitado
                      foregroundColor: Colors.white, // Color del texto
                    ),
                    child: const Text('Continuar'),
                  ),
                ),
              ),
            ],
          ),
          // Temporizador posicionado en la parte superior
          Positioned(
            top: screenHeight * 0.065,
            left: screenWidth * 0.42,
            child: TimerWidget(
              duration: 20 * 15,
              onTimerEnd: () {
                // Lógica cuando el tiempo se acaba
              },
            ),
          ),
        ],
      ),
    );
  }
}
