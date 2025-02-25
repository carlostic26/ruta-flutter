import 'package:flutter/material.dart';

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

class StatisticsScreen extends StatelessWidget {
  final List<double> scores = [
    2,
    4,
    6,
    8,
    10,
    7,
    5,
    3,
    1,
    9
  ]; // Puntajes de ejemplo

  StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Altura fija para el gráfico
      //padding: const EdgeInsets.all(8.0), // Padding interno
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: scores.map((score) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5.0), // ancho de la barra
                    decoration: BoxDecoration(
                      color: Colors.blue, // Color de las barras
                      borderRadius: BorderRadius.circular(4.0),
                    ),

                    height: score *
                        15, // Altura de la barra (ajustada para pantallas pequeñas)
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(scores.length, (index) {
              return Text(
                'N${index + 1}',
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              );
            }),
          ),
        ],
      ),
    );
  }
}
