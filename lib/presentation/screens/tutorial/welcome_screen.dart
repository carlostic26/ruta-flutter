import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/screens/tutorial/select_level_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      body: Column(
        children: [
          SizedBox(
            height: heightScreen * 0.15,
          ),
          const Text(
            'Bienvenido a\nRuta Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: heightScreen * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
                height: heightScreen * 0.2,
                width: widthScreen * 0.35,
                fit: BoxFit.fill,
                'assets/images/logo.jpg'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              'Tu compañero de ruta en el desarrollo móvil, para que cada desarrollador, sin importar su nivel, encuentre su camino.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          SizedBox(
            height: heightScreen * 0.1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  iconSize: 30,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectLevelScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
