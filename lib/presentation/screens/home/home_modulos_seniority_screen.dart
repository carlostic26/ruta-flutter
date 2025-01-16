import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/screens/path_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String iconJuniorDev =
      'https://wallpapers.com/images/hd/web-development-icon-ydevlmrk7b5v0hdx-2.jpg';
  String iconMiddleDev =
      'https://wallpapers.com/images/hd/web-development-icon-ydevlmrk7b5v0hdx-2.jpg';
  String iconSeniorDev =
      'https://wallpapers.com/images/hd/web-development-icon-ydevlmrk7b5v0hdx-2.jpg';

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      appBar: AppBar(
        title: const Text(
          'Módulos de Seniority',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpacerHome(heightScreen: heightScreen),
              //Junior Dev
              Row(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PathScreen()),
                        );
                      },
                      icon: const Icon(
                          color: Colors.white, Icons.arrow_forward_ios)),
                ],
              ),
              SpacerHome(heightScreen: heightScreen),

              //Middle Dev
              Row(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PathScreen()),
                        );
                      },
                      icon: const Icon(
                          color: Colors.white, Icons.arrow_forward_ios)),
                ],
              ),

              SpacerHome(heightScreen: heightScreen),

              //Senior Dev
              Row(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PathScreen()),
                        );
                      },
                      icon: const Icon(
                          color: Colors.white, Icons.arrow_forward_ios)),
                ],
              ),
            ],
          ),

/*           //Circle Icon Jr
          Positioned(
            top: heightScreen * 0.15,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.048,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/icons/icono_abierto.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ), */

          //Circle Icon Middle
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

          //Circle Icon Sr
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
        ]),
      ),
      bottomNavigationBar:
          SizedBox(height: heightScreen * 0.08, child: const Placeholder()),
    );
  }
}

class SpacerHome extends StatelessWidget {
  const SpacerHome({
    super.key,
    required this.heightScreen,
  });

  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightScreen * 0.05,
    );
  }
}
