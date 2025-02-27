/* import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';

import 'package:highlight/highlight.dart' show highlight, Node;

final customTheme = {
  'root': TextStyle(backgroundColor: Colors.grey[900], color: Colors.white),
  'comment': const TextStyle(color: Colors.green),
  'keyword': const TextStyle(color: Colors.blue),
  'string': const TextStyle(color: Colors.orange),
  'literal': const TextStyle(color: Colors.purple),
  'number': const TextStyle(color: Colors.teal),
  'class': const TextStyle(color: Colors.yellow),
  'punctuation': const TextStyle(color: Colors.white),
};

final codeControllerProvider = Provider<CodeController>((ref) {
  return CodeController(
    language: dart,
    text: 'void main() {\n  print("Hello, World!");\n}',
    patternMap: customTheme,
  );
});
 */