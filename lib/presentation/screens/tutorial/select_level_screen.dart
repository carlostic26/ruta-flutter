import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/screens/main/home_screen.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      body: Column(
        children: [
          SizedBox(height: heightScreen * 0.12),
          const Text(
            'Bienvenido a\nRuta Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: heightScreen * 0.10),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Stack(
                  //TODO: Extraer las flechas, dar nombre a cada una e invocarlas dentreo del stack
                  children: [
                    //flecha 1
                    Positioned(
                      left: widthScreen * 0.42,
                      top: heightScreen * 0.05,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: widthScreen * 0.42,
                          height: heightScreen * 0.15,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/flecha_level_tutorial.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //primer level
                    Positioned(
                      left: widthScreen * 0.05,
                      child: Column(
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
                          const Text(
                            'Flutter Junior Dev',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    //segundo level
                    Positioned(
                      right: widthScreen * 0.05,
                      top: heightScreen * 0.19,
                      child: Container(
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
                    ),

                    Positioned(
                      right: widthScreen * 0.05,
                      top: heightScreen * 0.19,
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

//flecha 2
                    Positioned(
                      left: widthScreen * 0.42,
                      top: heightScreen * 0.345,
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Container(
                          width: widthScreen * 0.42,
                          height: heightScreen * 0.15,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/flecha_level_tutorial.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //tercer level
                    Positioned(
                      left: widthScreen * 0.05,
                      bottom: heightScreen * 0.18,
                      child: Container(
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
                    ),

                    Positioned(
                      left: widthScreen * 0.05,
                      bottom: heightScreen * 0.18,
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          iconSize: 30,
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
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
      ),
    );
  }
}
