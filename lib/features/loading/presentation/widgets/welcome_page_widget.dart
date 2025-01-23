import 'package:flutter/material.dart';

class WelcomePageWidget extends StatelessWidget {
  const WelcomePageWidget({
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
          child: SizedBox(
            height: heightScreen * 0.16,
            width: widthScreen * 0.35,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
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
      ],
    );
  }
}
