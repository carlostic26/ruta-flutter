import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/score/presentation/widgets/score_info_widget.dart';

class ScoreScreen extends ConsumerWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mis puntajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InfoScoreWidget(module: 'Jr'),
            SizedBox(
              height: 50,
            ),
            InfoScoreWidget(module: 'Mid'),
            SizedBox(
              height: 50,
            ),
            InfoScoreWidget(module: 'Sr'),
          ],
        ),
      ),
    );
  }
}
