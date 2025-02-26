import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TopicLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createTopicTable(Database db) async {
    await db.execute('''
        CREATE TABLE topic(
          id TEXT,
          module TEXT,
          level_id INTEGER,
          title TEXT,
          PRIMARY KEY (module, level_id, id), -- Clave primaria compuesta
          FOREIGN KEY (module, level_id) REFERENCES level(module, id) ON DELETE CASCADE
        );
      ''');
    _insertTopicsLevel1Jr(db);
    _insertTopicsLevel2Jr(db);
    _insertTopicsLevel3Jr(db);
    _insertTopicsLevel4Jr(db);
    _insertTopicsLevel5Jr(db);
    _insertTopicsLevel6Jr(db);
    _insertTopicsLevel7Jr(db);
    _insertTopicsLevel8Jr(db);
    _insertTopicsLevel9Jr(db);
    _insertTopicsLevel10Jr(db);
  }

  Future<void> _insertTopicsLevel1Jr(db) async {
    await db.insert('topic', {
      'id': 't01l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Reglas de Sintaxis en Dart',
    });

    await db.insert('topic', {
      'id': 't02l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Declaración de Variables',
    });

    await db.insert('topic', {
      'id': 't03l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Tipos de Datos Primitivos',
    });

    await db.insert('topic', {
      'id': 't04l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Constantes y Finales',
    });

    await db.insert('topic', {
      'id': 't05l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Comentarios en Dart',
    });

    await db.insert('topic', {
      'id': 't06l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Estructura Básica de un Programa en Dart',
    });

    await db.insert('topic', {
      'id': 't07l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Impresión en Consola (print)',
    });

    await db.insert('topic', {
      'id': 't08l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Operadores Básicos (Aritméticos, Lógicos, Relacionales)',
    });

    await db.insert('topic', {
      'id': 't09l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Interpolación de Cadenas',
    });

    await db.insert('topic', {
      'id': 't10l1',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Conversión de Tipos de Datos',
    });
  }

  Future<void> _insertTopicsLevel2Jr(db) async {
    await db.insert('topic', {
      'id': 't01l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Condicionales: if, else',
    });

    await db.insert('topic', {
      'id': 't02l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Condicionales: else if',
    });

    await db.insert('topic', {
      'id': 't03l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Condicionales: switch y case',
    });

    await db.insert('topic', {
      'id': 't04l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Operador Ternario',
    });

    await db.insert('topic', {
      'id': 't05l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Bucles: for',
    });

    await db.insert('topic', {
      'id': 't06l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Bucles: while',
    });

    await db.insert('topic', {
      'id': 't07l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Bucles: do-while',
    });

    await db.insert('topic', {
      'id': 't08l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Bucles: for-in',
    });

    await db.insert('topic', {
      'id': 't09l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Control de Bucles: break y continue',
    });

    await db.insert('topic', {
      'id': 't10l2',
      'module': 'Jr',
      'level_id': 2,
      'title': 'Ejercicios Prácticos de Control de Flujo',
    });
  }

  Future<void> _insertTopicsLevel3Jr(db) async {
    await db.insert('topic', {
      'id': 't01l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Introducción a las Funciones',
    });

    await db.insert('topic', {
      'id': 't02l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Declaración de Funciones',
    });

    await db.insert('topic', {
      'id': 't03l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Parámetros y Argumentos',
    });

    await db.insert('topic', {
      'id': 't04l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Retorno de Valores',
    });

    await db.insert('topic', {
      'id': 't05l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Funciones Anónimas',
    });

    await db.insert('topic', {
      'id': 't06l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Funciones de Flecha (Arrow Functions)',
    });

    await db.insert('topic', {
      'id': 't07l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Ámbito (Scope) de las Funciones',
    });

    await db.insert('topic', {
      'id': 't08l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Funciones Recursivas',
    });

    await db.insert('topic', {
      'id': 't0l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Funciones como Objetos de Primera Clase',
    });

    await db.insert('topic', {
      'id': 't10l3',
      'module': 'Jr',
      'level_id': 3,
      'title': 'Ejercicios Prácticos de Funciones',
    });
  }

  Future<void> _insertTopicsLevel4Jr(db) async {
    await db.insert('topic', {
      'id': 't1l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Introducción a las Colecciones',
    });

    await db.insert('topic', {
      'id': 't2l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Listas en Dart',
    });

    await db.insert('topic', {
      'id': 't3l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Métodos Comunes de las Listas',
    });

    await db.insert('topic', {
      'id': 't4l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Mapas en Dart',
    });

    await db.insert('topic', {
      'id': 't5l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Métodos Comunes de los Mapas',
    });

    await db.insert('topic', {
      'id': 't6l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Conjuntos (Sets) en Dart',
    });

    await db.insert('topic', {
      'id': 't7l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Métodos Comunes de los Conjuntos',
    });

    await db.insert('topic', {
      'id': 't8l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Iterables y Iteradores',
    });

    await db.insert('topic', {
      'id': 't9l4',
      'module': 'Jr',
      'level_id': 4,
      'title': 'Ejercicios Prácticos con Colecciones',
    });
  }

  Future<void> _insertTopicsLevel5Jr(db) async {
    await db.insert('topic', {
      'id': 't1l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Introducción a la POO',
    });

    await db.insert('topic', {
      'id': 't2l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Clases y Objetos',
    });

    await db.insert('topic', {
      'id': 't3l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Propiedades y Métodos',
    });

    await db.insert('topic', {
      'id': 't4l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Constructores',
    });

    await db.insert('topic', {
      'id': 't5l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Herencia',
    });

    await db.insert('topic', {
      'id': 't6l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Polimorfismo',
    });

    await db.insert('topic', {
      'id': 't7l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Encapsulamiento',
    });

    await db.insert('topic', {
      'id': 't8l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Métodos Getters y Setters',
    });

    await db.insert('topic', {
      'id': 't9l5',
      'module': 'Jr',
      'level_id': 5,
      'title': 'Ejercicios Prácticos de POO',
    });
  }

  Future<void> _insertTopicsLevel6Jr(db) async {
    await db.insert('topic', {
      'id': 't1l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Introducción a los Widgets',
    });

    await db.insert('topic', {
      'id': 't2l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Diseño: Container, Row, Column',
    });

    await db.insert('topic', {
      'id': 't3l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Texto: Text, RichText',
    });

    await db.insert('topic', {
      'id': 't4l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Imágenes: Image, Icon',
    });

    await db.insert('topic', {
      'id': 't5l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Interacción: Button, GestureDetector',
    });

    await db.insert('topic', {
      'id': 't6l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Scroll: ListView, SingleChildScrollView',
    });

    await db.insert('topic', {
      'id': 't7l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Navegación: Navigator, Routes',
    });

    await db.insert('topic', {
      'id': 't8l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Widgets de Estado: StatelessWidget vs StatefulWidget',
    });

    await db.insert('topic', {
      'id': 't9l6',
      'module': 'Jr',
      'level_id': 6,
      'title': 'Ejercicios Prácticos con Widgets Básicos',
    });
  }

  Future<void> _insertTopicsLevel7Jr(db) async {
    await db.insert('topic', {
      'id': 't1l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Introducción a la Navegación en Flutter',
    });

    await db.insert('topic', {
      'id': 't2l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Navegación Básica: Navigator.push y Navigator.pop',
    });

    await db.insert('topic', {
      'id': 't3l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Pasar Datos entre Pantallas',
    });

    await db.insert('topic', {
      'id': 't4l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Navegación con Nombres de Rutas (Named Routes)',
    });

    await db.insert('topic', {
      'id': 't5l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Rutas con Argumentos',
    });

    await db.insert('topic', {
      'id': 't6l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Manejo de la Pila de Navegación',
    });

    await db.insert('topic', {
      'id': 't7l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Navegación con BottomNavigationBar',
    });

    await db.insert('topic', {
      'id': 't8l7',
      'module': 'Jr',
      'level_id': 7,
      'title': 'Ejercicios Prácticos de Navegación',
    });
  }

  Future<void> _insertTopicsLevel8Jr(db) async {
    await db.insert('topic', {
      'id': 't1l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Introducción al Ciclo de Vida en Flutter',
    });

    await db.insert('topic', {
      'id': 't2l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Método initState',
    });

    await db.insert('topic', {
      'id': 't3l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Método build',
    });

    await db.insert('topic', {
      'id': 't4l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Método dispose',
    });

    await db.insert('topic', {
      'id': 't5l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Método didChangeAppLifecycleState',
    });

    await db.insert('topic', {
      'id': 't6l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Manejo de Recursos en el Ciclo de Vida',
    });

    await db.insert('topic', {
      'id': 't7l8',
      'module': 'Jr',
      'level_id': 8,
      'title': 'Ejercicios Prácticos de Ciclo de Vida',
    });
  }

  Future<void> _insertTopicsLevel9Jr(db) async {
    await db.insert('topic', {
      'id': 't1l9',
      'module': 'Jr',
      'level_id': 9,
      'title': 'Introducción a los Temas en Flutter',
    });

    await db.insert('topic', {
      'id': 't2l9',
      'module': 'Jr',
      'level_id': 9,
      'title': 'Definir un Tema Global',
    });

    await db.insert('topic', {
      'id': 't3l9',
      'module': 'Jr',
      'level_id': 9,
      'title': 'Personalización de Colores y Tipografías',
    });

    await db.insert('topic', {
      'id': 't4l9',
      'module': 'Jr',
      'level_id': 9,
      'title': 'Uso de Temas en Widgets',
    });

    await db.insert('topic', {
      'id': 't5l9',
      'module': 'Jr',
      'level_id': 9,
      'title': 'Temas Oscuros y Claros',
    });

    await db.insert('topic', {
      'id': 't6l9',
      'module': 'Jr',
      'level_id': 9,
      'title': 'Ejercicios Prácticos de Temas',
    });
  }

  Future<void> _insertTopicsLevel10Jr(db) async {
    await db.insert('topic', {
      'id': 't01l10',
      'module': 'Jr',
      'level_id': 10,
      'title': 'Introducción a la Asincronía en Dart',
    });

    await db.insert('topic', {
      'id': 't02l10',
      'module': 'Jr',
      'level_id': 10,
      'title': 'Futures en Dart',
    });

    await db.insert('topic', {
      'id': 't03l10',
      'module': 'Jr',
      'level_id': 10,
      'title': 'Uso de async y await',
    });

    await db.insert('topic', {
      'id': 't04l10',
      'module': 'Jr',
      'level_id': 10,
      'title': 'Manejo de Errores en Futures',
    });

    await db.insert('topic', {
      'id': 't05l10',
      'module': 'Jr',
      'level_id': 10,
      'title': 'Streams en Dart',
    });

    await db.insert('topic', {
      'id': 't06l10',
      'module': 'Jr',
      'level_id': 10,
      'title': 'Ejercicios Prácticos de Asincronía',
    });
  }
}
