import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';

class CodeDetailWidget extends ConsumerStatefulWidget {
  const CodeDetailWidget({super.key, required this.detail});

  final DetailModel detail;

  @override
  ConsumerState<CodeDetailWidget> createState() => _CodeDetailWidgetState();
}

class _CodeDetailWidgetState extends ConsumerState<CodeDetailWidget> {
  double _fontSize = 15;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 8) _fontSize -= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String code = widget.detail.codeExample.toString();
    const theme = darculaTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 8, 1),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Este SingleChildScrollView permite desplazarse verticalmente
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: HighlightView(
                      code,
                      language: 'dart',
                      theme: theme,
                      padding: const EdgeInsets.fromLTRB(10, 55, 8, 1),
                      textStyle: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: _fontSize,
                      ),
                    ),
                  ),
                  // Botones de Zoom posicionados arriba del código
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black26,
                    child: Positioned(
                      top: 2,
                      right: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(CupertinoIcons.zoom_in),
                            onPressed: _increaseFontSize,
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: const Icon(CupertinoIcons.zoom_out),
                            onPressed: _decreaseFontSize,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
