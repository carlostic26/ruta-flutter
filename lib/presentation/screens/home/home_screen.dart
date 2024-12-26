import 'package:flutter/material.dart';
import 'package:ruta_flutter/commons/path_screen.dart';

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
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/jr_dev.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 35,
                        left: 20,
                        right: 20,
                        child: Center(
                          child: Text(
                            'Flutter\nJunior Dev',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                      child: Text(
                        'Encontrarás diversos conceptos básicos sobre: Dart y Flutter, tips, estructura de proyectos y widgets esenciales.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
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
                  Container(
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
                    child: Container(
                      width: widthScreen * 0.42,
                      height: heightScreen * 0.15,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        //color: Colors.black54,
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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                      child: Text(
                        'Aqui hay gestión de estados, patrones de diseño, clean architecture, consumo de APIs, testing y mejores prácticas para construir apps escalables.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
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
                  Container(
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
                    child: Stack(
                      children: [
                        Container(
                          width: widthScreen * 0.42,
                          height: heightScreen * 0.15,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            //color: Colors.black54,
                          ),
                          child: const Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Center(
                              child: Text(
                                'Flutter\nJunior Dev',
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
                  // Senior Dev
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                      child: Text(
                        'Aqui están las arquitecturas avanzadas, CI/CD, optimización de rendimiento, seguridad, mentoring y liderazgo técnico para proyectos empresariales.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
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

          //Circle Jr
          Positioned(
            top: heightScreen * 0.15,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.048,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
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
          ),

          //Circle Middle
          Positioned(
            top: heightScreen * 0.35,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.048,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/icons/icono_cerrado.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          //Circle Sr
          Positioned(
            top: heightScreen * 0.55,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.048,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
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
