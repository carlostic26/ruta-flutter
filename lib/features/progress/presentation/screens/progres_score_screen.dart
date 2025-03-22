import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/presentation/widgets/score_info_widget.dart';

class ProgressScoreScreen extends ConsumerWidget {
  const ProgressScoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'Mis puntajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ScoreInfoWidget(module: 'Jr'),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ScoreInfoWidget(module: 'Mid'),
              SizedBox(height: 20),
              ScoreInfoWidget(module: 'Sr'),
            ],
          ),
        ),
      ),
    );
  }
}
