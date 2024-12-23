import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/screens/modules/choose_topic_screen.dart';

class PathLearningWidget extends StatelessWidget {
  const PathLearningWidget({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
  });

  final double widthScreen;
  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Linea 1
        Positioned(
          left: widthScreen * 0.20,
          bottom: heightScreen * 0.135,
          child: Transform.rotate(
            angle: pi,
            child: SizedBox(
                height: heightScreen * 0.12,
                child: Image.asset('assets/images/linea_asset.png')),
          ),
        ),

        //Linea 2
        Positioned(
          left: widthScreen * 0.165,
          bottom: heightScreen * 0.23,
          child: Transform.rotate(
            angle: -pi / 2,
            child: SizedBox(
                height: heightScreen * 0.12,
                child: Image.asset('assets/images/linea_asset.png')),
          ),
        ),

        //Linea 3
        Positioned(
          right: widthScreen * 0.20,
          bottom: heightScreen * 0.35,
          child: Transform.rotate(
            angle: pi / 2,
            child: SizedBox(
                height: heightScreen * 0.12,
                child: Image.asset('assets/images/linea_asset.png')),
          ),
        ),

        //Linea 4
        Positioned(
          right: widthScreen * 0.22,
          top: heightScreen * 0.295,
          child: SizedBox(
              height: heightScreen * 0.12,
              child: Image.asset('assets/images/linea_asset.png')),
        ),

        //Linea 5
        Positioned(
          left: widthScreen * 0.18,
          top: heightScreen * 0.18,
          child: Transform.rotate(
            angle: pi,
            child: SizedBox(
                height: heightScreen * 0.12,
                child: Image.asset('assets/images/linea_asset.png')),
          ),
        ),

        //Linea 6
        Positioned(
          left: widthScreen * 0.162,
          top: heightScreen * 0.1,
          child: Transform.rotate(
            angle: -pi / 2,
            child: SizedBox(
                height: heightScreen * 0.12,
                child: Image.asset('assets/images/linea_asset.png')),
          ),
        ),

        //Circulo 1
        Positioned(
          left: widthScreen * 0.40,
          bottom: heightScreen * 0.1,
          child: GestureDetector(
            onTap: () {
              showDialogLearning(context);
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
              child: Container(
                width: widthScreen * 0.2,
                height: heightScreen * 0.09,
                color: Colors.grey,
              ),
            ),
          ),
        ),

        //Circulo 2
        Positioned(
          left: widthScreen * 0.10,
          bottom: heightScreen * 0.2,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Container(
              width: widthScreen * 0.2,
              height: heightScreen * 0.09,
              color: Colors.grey,
            ),
          ),
        ),

        //Circulo 3
        Positioned(
          left: widthScreen * 0.40,
          bottom: heightScreen * 0.3,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Container(
              width: widthScreen * 0.2,
              height: heightScreen * 0.09,
              color: Colors.grey,
            ),
          ),
        ),

        //Circulo 4
        Positioned(
          right: widthScreen * 0.14,
          bottom: heightScreen * 0.45,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Container(
              width: widthScreen * 0.2,
              height: heightScreen * 0.09,
              color: Colors.grey,
            ),
          ),
        ),

        //Circulo 5
        Positioned(
          right: widthScreen * 0.40,
          top: heightScreen * 0.25,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Container(
              width: widthScreen * 0.2,
              height: heightScreen * 0.09,
              color: Colors.grey,
            ),
          ),
        ),

        //Circulo 6
        Positioned(
          left: widthScreen * 0.1,
          top: heightScreen * 0.15,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Container(
              width: widthScreen * 0.2,
              height: heightScreen * 0.09,
              color: Colors.grey,
            ),
          ),
        ),

        //Circulo 7
        Positioned(
          left: widthScreen * 0.40,
          top: heightScreen * 0.05,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            child: Container(
              width: widthScreen * 0.2,
              height: heightScreen * 0.09,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showDialogLearning(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.grey,
          title: const Center(
            child: Text(
              'Iniciemos el aprendizaje',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: <Widget>[
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 25),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Este es el nivel 1 de 10. En el cual .... '),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.black12),
                      ),
                      child: const Text(
                        'Ok',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseTopicScreen()),
                        );
                      }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
