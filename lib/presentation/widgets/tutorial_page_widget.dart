import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/screens/home/home_modulos_screen.dart';

class TutorialPageWidget extends StatelessWidget {
  const TutorialPageWidget({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });

  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: heightScreen * 0.12),
        const Text(
          'Ruta Flutter',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: heightScreen * 0.02,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            'Avanzarás a través de 3 niveles secuenciales de seniority, con información, ejemplos y evaluaciones para un aprendizaje completo y efectivo sobre Dart, Flutter y las librerías que aporten valor.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        SizedBox(height: heightScreen * 0.08),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Stack(
                children: [
                  //flecha 1
                  Positioned(
                    left: widthScreen * 0.40,
                    top: heightScreen * 0.07,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: widthScreen * 0.40,
                        height: heightScreen * 0.15,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.5,
                            image: AssetImage(
                                'assets/images/icons/flecha_level_tutorial.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //flecha 2
                  Positioned(
                    left: widthScreen * 0.40,
                    top: heightScreen * 0.345,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Container(
                        width: widthScreen * 0.42,
                        height: heightScreen * 0.15,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.2,
                            image: AssetImage(
                                'assets/images/icons/flecha_level_tutorial.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //first level
                  Positioned(
                    left: widthScreen * 0.05,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Flutter Junior Dev',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: widthScreen * 0.42,
                          height: heightScreen * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/jr_dev.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //second level
                  Positioned(
                    right: widthScreen * 0.05,
                    top: heightScreen * 0.21,
                    child: Container(
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/middle_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // opacity and text
                  Positioned(
                    right: widthScreen * 0.05,
                    top: heightScreen * 0.21,
                    child: Container(
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black54,
                      ),
                      child: const Center(
                        child: Text(
                          'Flutter\nMiddle Dev',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  //third level
                  Positioned(
                    left: widthScreen * 0.05,
                    bottom: heightScreen * 0.13,
                    child: Container(
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sr_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // opacity and text
                  Positioned(
                    left: widthScreen * 0.05,
                    bottom: heightScreen * 0.13,
                    child: Container(
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black54,
                      ),
                      child: const Center(
                        child: Text(
                          'Flutter\nSenior Dev',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
