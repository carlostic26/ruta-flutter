import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';

class CodeDetailWidget extends StatelessWidget {
  const CodeDetailWidget({super.key, required this.detail});

  final DetailModel detail;

  @override
  Widget build(BuildContext context) {
    String code = detail.codeExample.toString();
    final lines = code.split('\n'); // Divide el código en líneas
    const theme = darculaTheme; // Tema oscuro

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Columna para los números de línea
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(lines.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'monospace',
                    fontSize: 15,
                  ),
                ),
              );
            }),
          ),
          // Columna para el código resaltado
          Expanded(
            child: HighlightView(
              code,
              language: 'dart',
              theme: theme,
              padding: EdgeInsets.zero,
              textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
