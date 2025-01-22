import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/modules/widgets/item_list_choose_widget.dart';

class ChooseTopicScreen extends StatelessWidget {
  const ChooseTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 64, 64),
      appBar: AppBar(
        title: const Text(
          'Choose topic list',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ItemListChooseWidget(),
            ItemListChooseWidget(),
            ItemListChooseWidget(),
            ItemListChooseWidget()
          ],
        ),
      ),
    );
  }
}
