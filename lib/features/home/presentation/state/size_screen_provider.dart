import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider para obtener la altura de la pantalla
final screenHeightProvider =
    Provider.family<double, BuildContext>((ref, context) {
  return MediaQuery.of(context).size.height;
});

// Provider para obtener el ancho de la pantalla
final screenWidthProvider =
    Provider.family<double, BuildContext>((ref, context) {
  return MediaQuery.of(context).size.width;
});
