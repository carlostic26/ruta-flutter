import 'package:flutter/material.dart';
import 'package:ruta_flutter/presentation/screens/modules/choose_subtopic_screen.dart';
import 'package:ruta_flutter/presentation/screens/modules/detail_topic_screen.dart';

class ItemListChooseWidget extends StatelessWidget {
  const ItemListChooseWidget({
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
            MaterialPageRoute(
                builder: (context) => const ChooseSubtopicScreen()),
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
              'Fundamentos de dart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
