import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/screens/path_screen.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
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
    String jrDescription =
        'Recorre desde cero los fundamentos esenciales de Flutter y Dart. Repasa la sintaxis, widgets y estructura básica. Gestionar activos y almacenamiento local. Este es el punto de partida perfecto para nuevos desarrolladores.';
    String midDescription =
        'Recorre los conceptos avanzados para construir apps robustas y optimizadas. Gestión de estado, integración con APIs, Firebase,Patrones de diseño, principios SOLID, pruebas automatizadas, técnicas de optimización y bases de datos avanzadas.';
    String srDescription =
        'Optimiza y escala aplicaciones con técnicas avanzadas. Repasa la programación reactiva, Streams y animaciones complejas. Aprende sobre gestión de memoria, Render Objects y CI/CD. Implementa despliegues automatizados y análisis de métricas. Completar este módulo te llevará al nivel de experto en Flutter.';

    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacerHomeWidget(heightScreen: heightScreen),
          //Junior Dev Module
          GestureDetector(
            onTap: () => goToPathScreen(context, 'Jr', ref),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/jr_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                          highlightColor: Colors.blue.withOpacity(0.2),
                          iconSize: 60,
                          onPressed: () {
                            ref.read(moduleProvider.notifier).state =
                                'Flutter Junior';

                            goToPathScreen(context, 'Jr', ref);
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Junior Dev',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          jrDescription,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
/*                 IconButton(
                    onPressed: () {
                      ref.read(moduleProvider.notifier).state =
                          'Flutter Junior';

                      goToPathScreen(context, 'Jr', ref);
                    },
                    icon: const Icon(
                        color: Colors.white, Icons.arrow_forward_ios)), */
              ],
            ),
          ),

          SpacerHomeWidget(heightScreen: heightScreen),

          //Middle Dev Module
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Debes terminar primero el modulo anterior'),
                ),
              );
              //goToPathScreen(context, 'Mid', ref),
            },
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.15,
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
                      height: heightScreen * 0.15,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(210, 0, 0, 0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Middle Dev',
                            style: TextStyle(
                              color: Colors.orange
                                  .withOpacity(0.3), //Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          midDescription,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                /*        IconButton(
                    onPressed: () {
                      ref.read(moduleProvider.notifier).state =
                          'Flutter Middle';

                      goToPathScreen(context, 'Mid', ref);
                    },
                    icon: const Icon(
                        color: Colors.white, Icons.arrow_forward_ios)), */
              ],
            ),
          ),

          SpacerHomeWidget(heightScreen: heightScreen),

          //Senior Dev Module
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Debes terminar primero el modulo anterior'),
                ),
              );
              //goToPathScreen(context, 'Sr', ref),
            },
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: widthScreen * 0.35,
                      height: heightScreen * 0.15,
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
                      height: heightScreen * 0.15,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(210, 0, 0, 0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Senior Dev',
                            style: TextStyle(
                              color: Colors.green.withOpacity(0.3),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          srDescription,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                /*             IconButton(
                    onPressed: () {
                      ref.read(moduleProvider.notifier).state =
                          'Flutter Senior';

                      goToPathScreen(context, 'Sr', ref);
                    },
                    icon: const Icon(
                        color: Colors.white, Icons.arrow_forward_ios)), */
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
        top: heightScreen * 0.625,
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

  void goToPathScreen(BuildContext context, String module, WidgetRef ref) {
    ref.read(moduleProvider.notifier).state = module;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PathScreen()),
    );
  }
}
