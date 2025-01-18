import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/widgets/tutorial_page_widget.dart';

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
          child: Image.asset('assets/images/logo.jpg',
              height: heightScreen * 0.2,
              width: widthScreen * 0.35,
              fit: BoxFit.fill),
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
