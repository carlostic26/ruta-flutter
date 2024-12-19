import 'package:flutter/material.dart';
import 'package:ruta_flutter/screens/path_screen.dart';

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
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
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
              SizedBox(
                height: heightScreen * 0.05,
              ),
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
                            image: AssetImage(
                                'assets/images/emoti_programador.png'),
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
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        'El primer modulo donde verás conceptos básicos de Dart y Flutter, tips, estructura de proyectos y widgets esenciales.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
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
              SizedBox(
                height: heightScreen * 0.02,
              ),
              Row(
                children: [
                  Container(
                    width: widthScreen * 0.42,
                    height: heightScreen * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/images/emoti_programador.png'),
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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        'El primer modulo donde verás conceptos básicos de Dart y Flutter, tips, estructura de proyectos y widgets esenciales.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
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
              SizedBox(
                height: heightScreen * 0.02,
              ),
              Row(
                children: [
                  Container(
                    width: widthScreen * 0.42,
                    height: heightScreen * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/images/emoti_programador.png'),
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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        'El primer modulo donde verás conceptos básicos de Dart y Flutter, tips, estructura de proyectos y widgets esenciales.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
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
            top: heightScreen * 0.18,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.05,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(iconJuniorDev),
                ),
              ),
              child: Image.network(iconJuniorDev),
            ),
          ),

          //Circle
          Positioned(
            top: heightScreen * 0.35,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.05,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(iconJuniorDev),
                  fit: BoxFit.fill,
                ),
              ),
              child: Image.network(iconJuniorDev),
            ),
          ),

          //Circle
          Positioned(
            top: heightScreen * 0.52,
            right: widthScreen * 0.5,
            child: Container(
              width: widthScreen * 0.10,
              height: heightScreen * 0.05,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(iconJuniorDev),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image.network(iconJuniorDev),
            ),
          ),
        ]),
      ),
      bottomNavigationBar:
          SizedBox(height: heightScreen * 0.08, child: const Placeholder()),
    );
  }
}
