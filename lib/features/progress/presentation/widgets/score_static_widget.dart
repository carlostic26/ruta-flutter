import 'package:flutter/material.dart';

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
                  return Stack(alignment: Alignment.bottomCenter, children: [
                    //sombra de fondo de la barra color oscuro
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0), // Espacio entre barras
                      width: 20, // Ancho de cada barra
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      height: 150, // Altura de la barra
                    ),

                    //puntaje de barra en color azul
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0), // Espacio entre barras
                      width: 20, // Ancho de cada barra
                      decoration: BoxDecoration(
                        color: Colors.blue, // Color de las barras
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      height: score * 10, // Altura de la barra (ajustada)
                    ),
                  ]);
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
                    style: const TextStyle(color: Colors.grey, fontSize: 8),
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
