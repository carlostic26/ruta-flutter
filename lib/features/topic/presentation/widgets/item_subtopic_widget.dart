import 'package:flutter/material.dart';
import 'package:ruta_flutter/features/topic/data/model/subtopic_model.dart';
import 'package:ruta_flutter/features/topic/presentation/screens/subtopic_screen.dart';

class ItemSubtopicWidget extends StatelessWidget {
  final SubtopicModel subtopic;

  const ItemSubtopicWidget({
    super.key,
    required this.subtopic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubtopicScreen()),
          );
        },
        child: Container(
          height: 48,
          width: 400,
          decoration: BoxDecoration(
            color: const Color(0xFF2962FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtopic.title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
