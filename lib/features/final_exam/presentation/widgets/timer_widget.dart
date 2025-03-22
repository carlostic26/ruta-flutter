import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final int duration;

  const TimerWidget({required this.duration, super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Tiempo restante: $duration segundos');
  }
}
