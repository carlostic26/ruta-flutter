import 'dart:math';
import 'package:flutter/material.dart';

class GenerateRoutePathWidget extends StatelessWidget {
  final int numeroCirculos;
  final Color rutaColor;
  final double widthScreen;
  final double heightScreen;

  const GenerateRoutePathWidget({
    super.key,
    required this.numeroCirculos,
    required this.rutaColor,
    required this.widthScreen,
    required this.heightScreen,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    // Posiciones fijas para el primer círculo y la primera línea
    double circleCenterScreen = widthScreen * 0.40; // Centro en X
    double circleLeftScreen = widthScreen * 0.10; // Izquierda en X
    double circleRightScreen = widthScreen * 0.70; // Derecha en X

    // Línea 1 (fija)
    widgets.add(
      Positioned(
        left: widthScreen * 0.18,
        bottom: heightScreen * 0.08,
        child: Transform.rotate(
          angle: pi,
          child: SizedBox(
            height: heightScreen * 0.12,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
              child: Image.asset('assets/icons/linea_asset.png'),
            ),
          ),
        ),
      ),
    );

    // Círculo 1 (fijo)
    widgets.add(
      Positioned(
        left: circleCenterScreen,
        bottom: heightScreen * 0.05,
        child: GestureDetector(
          onTap: () {
            showDialogLearning(context);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: widthScreen * 0.17,
              height: widthScreen * 0.17,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );

    // Generar círculos y líneas restantes
    double currentBottom =
        heightScreen * 0.15; // Comenzar desde la posición de la línea 1

    for (int i = 2; i <= numeroCirculos; i++) {
      // Calcular posición del círculo
      double circleX;
      if (i % 2 == 0) {
        // Círculos pares: alternar entre izquierda y derecha
        circleX = (i ~/ 2) % 2 == 0 ? circleRightScreen : circleLeftScreen;
      } else {
        // Círculos impares: centro
        circleX = circleCenterScreen;
      }

      // Calcular posición y rotación de la línea
      if (i < numeroCirculos) {
        double lineAngle;
        double lineLeft;
        double lineBottom = currentBottom + heightScreen * 0.035;

        // Determinar la rotación basada en el índice de la línea
        if (i % 4 == 1) {
          // Líneas 1, 5, 9, etc.
          lineAngle = pi;
          lineLeft = circleX - widthScreen * 0.23;
        } else if (i % 4 == 2) {
          // Líneas 2, 6, 10, etc.
          lineAngle = -pi / 2;
          lineLeft = circleX + widthScreen * 0.05;
        } else if (i % 4 == 3) {
          // Líneas 3, 7, 11, etc.
          lineAngle = pi / 2;
          lineLeft = circleX + widthScreen * 0.115;
        } else {
          // Líneas 4, 8, 12, etc.
          lineAngle = 2 * pi; // Rotación hacia la izquierda
          lineLeft = circleX - widthScreen * 0.2;
        }

        // Añadir línea
        widgets.add(
          Positioned(
            left: lineLeft,
            bottom: lineBottom,
            child: Transform.rotate(
              angle: lineAngle,
              child: SizedBox(
                height: heightScreen * 0.12,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                  child: Image.asset('assets/icons/linea_asset.png'),
                ),
              ),
            ),
          ),
        );
      }

      // Añadir círculo
      widgets.add(
        Positioned(
          left: circleX,
          bottom: currentBottom,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: widthScreen * 0.17,
              height: widthScreen * 0.17,
              color: Colors.grey,
            ),
          ),
        ),
      );

      // Actualizar posición para el siguiente círculo
      currentBottom += heightScreen * 0.12;
    }
    // Calcular la altura total del Stack
    double stackHeight =
        currentBottom + heightScreen * 0.02; // Altura total requerida

    return SingleChildScrollView(
      child: SizedBox(
        height: stackHeight,
        child: Stack(children: widgets),
      ),
    );
  }

  void showDialogLearning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aprendizaje'),
          content: const Text('Has tocado un círculo.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
