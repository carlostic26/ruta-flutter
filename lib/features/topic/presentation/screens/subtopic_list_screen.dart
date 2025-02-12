import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/detail_topic_screen.dart';

class ChooseSubtopicScreen extends StatelessWidget {
  const ChooseSubtopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Name last Topic',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [ItemSubtopic(), ItemSubtopic(), ItemSubtopic()],
        ),
      ),
    );
  }
}

class ItemSubtopic extends StatelessWidget {
  const ItemSubtopic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailTopicScreen()),
          );
        },
        child: Container(
          height: 45,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 12, top: 7),
            child: Text(
              'Fuciones',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
