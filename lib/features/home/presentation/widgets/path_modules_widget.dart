import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/choose_topic_screen.dart';

class PathCircleLevelsWidget extends ConsumerWidget {
  const PathCircleLevelsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    double circleCenterScreen = widthScreen * 0.40;
    double circleLeftScreen = widthScreen * 0.10;
    double circleRightScreen = widthScreen * 0.10;

    //Todo: crear un mismo color para las lineas de la ruta

    Color rutaColor = Colors.white;

    final levelList = ref.watch(levelListProvider);

    //TODO: Crear un algoritmo (metodo) que dado un numero entero cree o dibuje un numero de circulos en pantalla, teniendo en cuenta que no puede haber mas de 1 circulo por row, se debe tener en cuenta el nivel inicial, las 4 direcciones y las lineas que lo conectan

    //TODO: Recibir la lista de niveles enviarla al metodo de dialogo (widget) y mostrar la info del objeto level x

    return Stack(
      children: [
        //Linea 1
        Positioned(
          left: widthScreen * 0.18,
          bottom: heightScreen * 0.09,
          child: Transform.rotate(
            angle: pi,
            child: SizedBox(
              height: heightScreen * 0.12,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                  child: Image.asset('assets/icons/linea_asset.png')),
            ),
          ),
        ),

        //Linea 2
        Positioned(
          left: widthScreen * 0.165,
          bottom: heightScreen * 0.20,
          child: Transform.rotate(
            angle: -pi / 2,
            child: SizedBox(
              height: heightScreen * 0.12,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                  child: Image.asset('assets/icons/linea_asset.png')),
            ),
          ),
        ),

        //Linea 3
        Positioned(
          right: widthScreen * 0.17,
          bottom: heightScreen * 0.325,
          child: Transform.rotate(
            angle: pi / 2,
            child: SizedBox(
              height: heightScreen * 0.12,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                  child: Image.asset('assets/icons/linea_asset.png')),
            ),
          ),
        ),

        //Linea 4
        Positioned(
          right: widthScreen * 0.20,
          top: heightScreen * 0.290,
          child: SizedBox(
            height: heightScreen * 0.12,
            child: ColorFiltered(
                colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                child: Image.asset('assets/icons/linea_asset.png')),
          ),
        ),

        //Linea 5
        Positioned(
          left: widthScreen * 0.18,
          top: heightScreen * 0.18,
          child: Transform.rotate(
            angle: pi,
            child: SizedBox(
              height: heightScreen * 0.12,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                  child: Image.asset('assets/icons/linea_asset.png')),
            ),
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
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(rutaColor, BlendMode.srcIn),
                  child: Image.asset('assets/icons/linea_asset.png')),
            ),
          ),
        ),

        //Circulo 1
        Positioned(
          left: circleCenterScreen,
          bottom: heightScreen * 0.05,
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
          left: circleLeftScreen,
          bottom: heightScreen * 0.155,
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
          left: circleCenterScreen,
          bottom: heightScreen * 0.27,
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
          right: circleRightScreen,
          bottom: heightScreen * 0.38,
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
          right: circleCenterScreen,
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
          left: circleLeftScreen,
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
          left: circleCenterScreen,
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
              'Nivel 1',
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
                      'En este nivel repasarás los conceptos de ... \nAl final tendrás que superar el test de conocimiento en almenos un 75%'),
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
