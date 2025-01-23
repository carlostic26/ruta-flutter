import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/path_levels/presentation/path_screen.dart';
import 'package:ruta_flutter/features/home/presentation/widgets/spacer_home_widget.dart';

class HomeContainWidget extends StatelessWidget {
  const HomeContainWidget({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });

  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
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
                      width: widthScreen * 0.42,
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
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      children: [
                        Text(
                          'Flutter Junior Dev',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Encontrarás diversos conceptos básicos sobre: Dart y Flutter, tips, estructura de proyectos y widgets esenciales.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
                      width: widthScreen * 0.42,
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
                    Container(
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
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
                        Text(
                          'Flutter Middle Dev',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Aqui hay gestión de estados, patrones de diseño, clean architecture, consumo de APIs, testing y mejores prácticas para construir apps escalables.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
                      width: widthScreen * 0.42,
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
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
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
                        Text(
                          'Flutter Senior Dev',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Aqui están las arquitecturas avanzadas, CI/CD, optimización de rendimiento, seguridad, mentoring y liderazgo técnico para proyectos empresariales.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
        top: heightScreen * 0.38,
        left: widthScreen * 0.065,
        child: SizedBox(
          width: widthScreen * 0.30,
          height: heightScreen * 0.1,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/icons/icono_cerrado.png',
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
          width: widthScreen * 0.30,
          height: heightScreen * 0.1,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/icons/icono_cerrado.png',
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
