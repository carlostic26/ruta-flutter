import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/presentation/screens/path_screen.dart';
import 'package:ruta_flutter/features/home/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/home/presentation/widgets/spacer_home_widget.dart';

class ModuleWidget extends ConsumerWidget {
  const ModuleWidget({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });

  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacerHomeWidget(heightScreen: heightScreen),
          //Junior Dev Module
          GestureDetector(
            onTap: () => goToPathScreen(context),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/jr_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Junior Dev',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'Sintaxis de Dart, tipos de datos, funciones, control de flujo, navegación, widgets, estructura de proyectos, estado básico...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ref.read(moduleProvider.notifier).state =
                          'Flutter Junior';

                      goToPathScreen(context);
                    },
                    icon: const Icon(
                        color: Colors.white, Icons.arrow_forward_ios)),
              ],
            ),
          ),

          SpacerHomeWidget(heightScreen: heightScreen),

          //Middle Dev Module
          GestureDetector(
            onTap: () => goToPathScreen(context),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/middle_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    //opaco
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.12,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(167, 0, 0, 0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Middle Dev',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'Basicos de Clean architecture, gestores de estado, animaciones, routing, firebase, sqflite, integracion con APIs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ref.read(moduleProvider.notifier).state =
                          'Flutter Middle';

                      goToPathScreen(context);
                    },
                    icon: const Icon(
                        color: Colors.white, Icons.arrow_forward_ios)),
              ],
            ),
          ),

          SpacerHomeWidget(heightScreen: heightScreen),

          //Senior Dev Module
          GestureDetector(
            onTap: () => goToPathScreen(context),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sr_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.12,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(167, 0, 0, 0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Senior Dev',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'Arquitecturas avanzadas, testing, isolates, streams, internacionalización, CI/CD, optimización de rendimiento, ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ref.read(moduleProvider.notifier).state =
                          'Flutter Senior';

                      goToPathScreen(context);
                    },
                    icon: const Icon(
                        color: Colors.white, Icons.arrow_forward_ios)),
              ],
            ),
          ),
        ],
      ),

      //Icon Secure Middle
      Positioned(
        top: heightScreen * 0.395,
        left: widthScreen * 0.065,
        child: SizedBox(
          width: widthScreen * 0.22,
          height: heightScreen * 0.08,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/icons/icono_cerrado.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),

      //Icon Secure Sr
      Positioned(
        top: heightScreen * 0.58,
        left: widthScreen * 0.065,
        child: SizedBox(
          width: widthScreen * 0.22,
          height: heightScreen * 0.08,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/icons/icono_cerrado.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ]);
  }

  void goToPathScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PathScreen()),
    );
  }
}
