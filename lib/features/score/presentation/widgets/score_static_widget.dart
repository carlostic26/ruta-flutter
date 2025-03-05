import 'package:flutter/material.dart';
/* 
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
 */

class StatisticsScreen extends StatelessWidget {
  final List<double> scores;

  const StatisticsScreen({
    super.key,
    required this.scores,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Altura fija para el gráfico
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll horizontal
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: scores.map((score) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5.0), // Espacio entre barras
                    width: 20, // Ancho de cada barra
                    decoration: BoxDecoration(
                      color: Colors.blue, // Color de las barras
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    height: score * 10, // Altura de la barra (ajustada)
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(scores.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 20, // Ancho de cada etiqueta
                  child: Text(
                    'N${index + 1}',
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
