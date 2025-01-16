import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/widgets/path_modules_widget.dart';

class PathScreen extends StatefulWidget {
  const PathScreen({super.key});

  @override
  State<PathScreen> createState() => _PathScreenState();
}

class _PathScreenState extends State<PathScreen> {
  final String _selectedLevel = 'Junior';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      appBar: AppBar(
        title: Text(
          'Ruta $_selectedLevel',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
        //leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: const PathCircleModulesWidget(),
      bottomNavigationBar: const SizedBox(height: 80, child: Placeholder()),
    );
  }
}
