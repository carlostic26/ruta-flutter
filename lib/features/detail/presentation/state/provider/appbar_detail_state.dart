import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definimos un enum para las secciones
enum AppBarSection { definition, code }

// Creamos un StateProvider para manejar la sección activa
final appBarSectionProvider = StateProvider<AppBarSection>(
  (ref) => AppBarSection.definition, // Estado inicial: "Definición"
);
