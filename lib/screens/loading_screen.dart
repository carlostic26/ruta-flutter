import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Placeholder(
              child: SizedBox(
                height: heightScreen * 0.2,
                width: widthScreen * 0.35,
                child: Image.asset(fit: BoxFit.fill, 'assets/images/logo.jpg'),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.02,
            ),
            SizedBox(
              height: heightScreen * 0.03,
              width: widthScreen * 0.85,
              child: LinearPercentIndicator(
                  alignment: MainAxisAlignment.center,
                  width: widthScreen * 0.65,
                  lineHeight: 7,
                  percent: 100 / 100,
                  animation: true,
                  animationDuration: 10000,
                  progressColor: Colors.blueGrey),
            ),
            const Text(
              "Cargando...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: heightScreen * 0.1,
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.blueGrey),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
