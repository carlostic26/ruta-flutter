import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ruta_flutter/features/tutorial/welcome_screen.dart';
import 'package:ruta_flutter/features/home/presentation/state/button_loading_state.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    final btnEnabled = ref.watch(buttonState);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
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
                animationDuration: 3000,
                progressColor: Colors.blueGrey,
                onAnimationEnd: () =>
                    ref.read(buttonState.notifier).enableButton(),
              ),
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
                onPressed: () {
                  if (btnEnabled == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: btnEnabled
                      ? WidgetStateProperty.all<Color>(Colors.blueGrey)
                      : WidgetStateProperty.all<Color>(
                          const Color.fromARGB(108, 57, 57, 57)),
                ),
                child: Text(
                  'Continuar',
                  style:
                      TextStyle(color: btnEnabled ? Colors.white : Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
