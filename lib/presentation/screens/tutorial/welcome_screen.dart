import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/widgets/tutorial_page_widget.dart';
import 'package:ruta_flutter/presentation/widgets/welcome_page_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    //TODO: crear un array que contenga los widgets.
    //TODO: crear controller y hacer que exista desplazamiento en el boton next
    //TODO: Detectar la ultima page para que al dar en siguiente nos lleve a home

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(children: [
              WelcomePageWidget(
                  heightScreen: heightScreen, widthScreen: widthScreen),
              TutorialPageWidget(
                  heightScreen: heightScreen, widthScreen: widthScreen),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 30,
                onPressed: () async {
/*                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TutorialPageWidget(
                            heightScreen: heightScreen,
                            widthScreen: widthScreen)),
                  ); */
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
    );
  }
}
