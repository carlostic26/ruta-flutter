import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/presentation/widgets/module_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Módulos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child:
            ModuleWidget(heightScreen: heightScreen, widthScreen: widthScreen),
      ),
      bottomNavigationBar:
          SizedBox(height: heightScreen * 0.08, child: const Placeholder()),
    );
  }
}
