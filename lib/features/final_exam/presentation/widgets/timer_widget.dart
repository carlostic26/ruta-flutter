import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final int duration; // Dur
  final VoidCallback? onTimerEnd;

  const TimerWidget({required this.duration, this.onTimerEnd, super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
        _startTimer();
      } else {
        widget.onTimerEnd?.call();
      }
    });
  }

  // Método para formatear el tiempo en minutos y segundos
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60; // Obtener los minutos
    int remainingSeconds = seconds % 60; // Obtener los segundos restantes
    // Formatear como "mm:ss"
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // Calcular el progreso (valor entre 0.0 y 1.0)
    double progress = _remainingTime / widget.duration;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        // CircularProgressIndicator que se pinta en retroceso
        SizedBox(
          width: screenWidth * 0.17,
          height: screenWidth * 0.17,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 25, 25, 28),
            ),
            child: CircularProgressIndicator(
              value: progress, // Valor del progreso
              backgroundColor: Colors.grey[300], // Color de fondo del círculo
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Color del progreso
              strokeWidth: 8, // Grosor de la línea
            ),
          ),
        ),
        // Texto del temporizador centrado
        Text(
          _formatTime(_remainingTime),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
