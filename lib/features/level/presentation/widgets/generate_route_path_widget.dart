import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/data/models/level_model.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/level/presentation/state/shared_preferences_provider.dart';
import 'package:ruta_flutter/features/level/presentation/widgets/confeti_widget.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/topic_screen.dart';

class GenerateLevelsRoutePathWidget extends ConsumerWidget {
  const GenerateLevelsRoutePathWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    // Obtener la instancia de GetLevelUseCase
    final getLevelUseCase = ref.read(getLevelUseCaseProvider);
    final moduleSelected = ref.watch(moduleProvider);

    // Obtener la lista de niveles completados desde el provider
    final completedLevels = ref.watch(completedLevelsProvider);

    // Obtener el último nivel completado
    final lastCompletedLevel =
        ref.watch(completedLevelsProvider.notifier).getLastCompletedLevel();

    // Posiciones fijas para el primer círculo y la primera línea
    double circleCenterScreen = widthScreen * 0.40;
    double circleLeftScreen = widthScreen * 0.10;
    double circleRightScreen = widthScreen * 0.10;

    Color rutaColorLineDefault = Colors.grey;
    Color rutaColorLineCompleted = Colors.green;

    // FutureBuilder para obtener la lista de niveles
    return FutureBuilder<List<LevelModel>>(
      future: getLevelUseCase.call(moduleSelected),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron niveles.'));
        }

        final levelList = snapshot.data!;

        List<Widget> widgets = [];

        double currentBottom =
            heightScreen * 0.15; // Comenzar desde la posición de la línea 1

        for (int i = 0; i < levelList.length; i++) {
          final level = levelList[i]; // Obtener el nivel actual

          // Determinar si el nivel está completado
          final isLevelCompleted = completedLevels.contains(level.order);

          // Determinar si este es el último nivel completado
          final isLastCompletedLevel = lastCompletedLevel == level.order;

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
          if (i < levelList.length - 1) {
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
                      colorFilter: isLevelCompleted
                          ? ColorFilter.mode(
                              rutaColorLineCompleted, BlendMode.srcIn)
                          : ColorFilter.mode(
                              rutaColorLineDefault, BlendMode.srcIn),
                      child: Image.asset('assets/icons/linea_asset.png'),
                    ),
                  ),
                ),
              ),
            );
          }

          // Añadir círculo con animación de confeti
          widgets.add(
            Positioned(
              left: circleX,
              bottom: currentBottom,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Animación de confeti (detrás del botón)
                  if (isLastCompletedLevel)
                    ConfettiAnimation(isCompleted: isLastCompletedLevel),

                  // Botón circular
                  AnimatedButton(
                    shape: BoxShape.circle,
                    height: heightScreen * 0.075,
                    width: heightScreen * 0.075,
                    color: isLevelCompleted
                        ? Colors.green
                        : const Color(0xFF2962FF),
                    onPressed: () {
                      showDialogLearning(context, level, ref);
                    },
                    enabled: true,
                    shadowDegree: ShadowDegree.light,
                    child: Text(
                      (i + 1).toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

          // Actualizar posición para el siguiente círculo
          currentBottom += heightScreen * 0.10;

          // Obtener el último nivel completado
          // Limpiar el último nivel completado después de mostrar la animación
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (lastCompletedLevel != null) {
              ref
                  .read(completedLevelsProvider.notifier)
                  .clearLastCompletedLevel();
            }
          });
        }

        // Calcular la altura total del Stack
        double stackHeight = currentBottom + heightScreen * 0.02;

        final ScrollController scrollController = ScrollController();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(const Duration(milliseconds: 300), () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
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
      },
    );
  }
}

Future<dynamic> showDialogLearning(
    BuildContext context, LevelModel level, WidgetRef ref) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Center(
          child: Text(
            level.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      level.description!,
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.justify,
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  totalRepeatCount: 1, // Número de repeticiones
                  displayFullTextOnTap:
                      true, // Muestra el texto completo al tocar
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color(0xFF2962FF),
                      ),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onPressed: () {
                      ref.read(actualLevelIdProvider.notifier).state =
                          level.order!;
                      // ref.read(actualLevelProvider.notifier).state = level.order!;
                      ref.read(levelTitleProvider.notifier).state =
                          level.title!;

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TopicScreen()),
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
