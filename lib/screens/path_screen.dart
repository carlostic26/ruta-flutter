import 'package:flutter/material.dart';

class PathScreen extends StatefulWidget {
  const PathScreen({super.key});

  @override
  State<PathScreen> createState() => _PathScreenState();
}

class _PathScreenState extends State<PathScreen> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: Stack(
        children: [
          Positioned(
            left: widthScreen * 0.40,
            bottom: heightScreen * 0.1,
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
          Positioned(
            right: widthScreen * 0.20,
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
        ],
      ),
    );
  }
}
