import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/score/presentation/state/provider/score_use_cases_provider.dart';
import 'package:ruta_flutter/features/score/presentation/widgets/score_static_widget.dart';

/* 

class InfoScoreWidget extends StatelessWidget {
  final String module;
  const InfoScoreWidget({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            module,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: SizedBox(
            height: 150,
            child: StatisticsScreen(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nivel Actual',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'Nivel Actual',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Exmanen final:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'No iniciado',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Puntos acumulados:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    '135/800',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Progreso',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Placeholder(),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoScoreWidget extends ConsumerWidget {
  final String module;
  const InfoScoreWidget({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreUseCases = ref.read(scoreUseCasesProvider);

    //recuerda que puedo acceder a getByModule haciendo scoreUseCases.getByModule

    return FutureBuilder<List<double>>(
      future: _getScoresForModule(scoreUseCases.getByModule(module)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay datos disponibles.'));
        } else {
          final scores = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  module,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: SizedBox(
                  height: 150,
                  child: StatisticsScreen(scores: scores),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nivel Actual',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'Nivel Actual',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Examen final:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'No iniciado',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Puntos acumulados:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          '135/800',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'Progreso',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Placeholder(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider()
            ],
          );
        }
      },
    );
  }

  // Método para obtener los puntajes
  // Método para obtener los puntajes
  Future<List<double>> _getScoresForModule(
      Future<List<int>> scoresFuture) async {
    final scores = await scoresFuture;
    return scores
        .map((score) => score.toDouble())
        .toList(); // Convertir List<int> a List<double>
  }
}
