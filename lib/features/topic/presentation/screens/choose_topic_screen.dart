import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/home/presentation/widgets/item_list_choose_widget.dart';

class ChooseTopicScreen extends StatelessWidget {
  const ChooseTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose topic list',
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
