import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/choose_topic_screen.dart';

class GenerateRoutePathWidget extends StatelessWidget {
  final int numeroCirculos;

  const GenerateRoutePathWidget({
    super.key,
    required this.numeroCirculos,
  });

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    // Posiciones fijas para el primer círculo y la primera línea
    double circleCenterScreen = widthScreen * 0.40;
    double circleLeftScreen = widthScreen * 0.10;
    double circleRightScreen = widthScreen * 0.10;

    Color rutaColor = Colors.white;

    List<Widget> widgets = [];
/* 
    // Línea 1 (fija)
    widgets.add(
      Positioned(
        left: widthScreen * 0.17,
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
        left: circleCenterScreen * 0.6,
        bottom: heightScreen * 0.05,
        child: AnimatedButton(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
          onPressed: () {},
          enabled: true,
          shadowDegree: ShadowDegree.light,
          duration: 10,
          child: const Text(
            '1',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

     */ // Generar círculos y líneas restantes
    double currentBottom =
        heightScreen * 0.15; // Comenzar desde la posición de la línea 1

    for (int i = 1; i <= numeroCirculos; i++) {
      // Calcular posición del círculo
      double circleX;
      if (i % 2 == 0) {
        // Círculos pares: alternar entre izquierda y derecha
        if (i % 4 == 0) {
          // Círculos 4, 8, 12, etc.: derecha
          circleX = circleRightScreen * 7;
        } else {
          // Círculos 2, 6, 10, etc.: izquierda
          circleX = circleLeftScreen;
        }
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
          lineLeft = circleX - widthScreen * 0.225;
        } else if (i % 4 == 2) {
          // Líneas 2, 6, 10, etc.
          lineAngle = -pi / 2;
          lineLeft = circleX + widthScreen * 0.045;
          lineBottom = lineBottom - heightScreen * 0.019;
        } else if (i % 4 == 3) {
          // Líneas 3, 7, 11, etc.
          lineAngle = pi / 2;
          lineLeft = circleX + widthScreen * 0.115;
          lineBottom = lineBottom + heightScreen * 0.005;
        } else {
          // Líneas 4, 8, 12, etc.
          lineAngle = 2 * pi; // Rotación hacia la izquierda
          lineLeft = circleX - widthScreen * 0.21;
          lineBottom = lineBottom - heightScreen * 0.01;
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
          child: AnimatedButton(
            shape: BoxShape.circle,
            height: heightScreen * 0.075,
            width: heightScreen * 0.075,
            color: Colors.blueGrey,
            onPressed: () {
              //TODO: enviar el objeto level al dialogo
              showDialogLearning(context);
            },
            enabled: true,
            shadowDegree: ShadowDegree.light,
            child: Text(
              i.toString(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      // Actualizar posición para el siguiente círculo
      currentBottom += heightScreen * 0.10;
    }
    // Calcular la altura total del Stack
    double stackHeight =
        currentBottom + heightScreen * 0.02; // Altura total requerida

    final ScrollController scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration:
              const Duration(milliseconds: 500), // Duración de la animación
          curve: Curves.easeOut, // Tipo de animación
        );
      });
    });

    return SingleChildScrollView(
      controller: scrollController,
      child: SizedBox(
        height: stackHeight,
        child: Stack(children: widgets),
      ),
    );
  }

  Future<dynamic> showDialogLearning(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.grey,
          title: const Center(
            child: Text(
              'Nivel 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: <Widget>[
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 25),
                  child: Text(
                      textAlign: TextAlign.center,
                      'En este nivel repasarás los conceptos de ... \nAl final tendrás que superar el test de conocimiento en almenos un 75%'),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.black12),
                      ),
                      child: const Text(
                        'Ok',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseTopicScreen()),
                        );
                      }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
