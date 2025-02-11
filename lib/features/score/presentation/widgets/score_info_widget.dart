import 'package:flutter/material.dart';

class InfoScoreWidget extends StatelessWidget {
  final String module;
  const InfoScoreWidget({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            module,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: SizedBox(
            height: 100,
            child: Placeholder(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nivel Actual',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'Nivel Actual',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Exmanen final:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'No iniciado',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Puntos acumulados:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    '135/800',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Progreso',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Placeholder(),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
