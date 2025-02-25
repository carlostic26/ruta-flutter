import 'package:path/path.dart';
import 'package:ruta_flutter/features/topic/data/datasources/subtopic_local_database.dart';
import 'package:ruta_flutter/features/topic/data/datasources/topic_local_database.dart';
import 'package:sqflite/sqflite.dart';

class LevelLocalDatabaseHelper {
  Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'ruta_flutter_15.db'), version: 1,
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE level(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          module TEXT,
          num_order INTEGER,
          title TEXT,
          description TEXT,
          points INTEGER,
          is_completed INTEGER
        );
      ''');

      await _insertLevelsJr(db);
      await _insertLevelsMid(db);
      await _insertLevelsSr(db);

      //Llamado a la creación de las tablas de topic y subtopic desde este feature (level)
      TopicLocalDatabaseHelper topicDb = TopicLocalDatabaseHelper();
      topicDb.createTopicTable();

      SubtopicLocalDatabaseHelper subtopicDb = SubtopicLocalDatabaseHelper();
      subtopicDb.createSubtopicTable();
    });
  }

  Future<void> _insertLevelsJr(db) async {
    await db.insert('level', {
      'module': 'Jr',
      'num_order': 1,
      'title': 'Sintaxis Básica de Dart',
      'description':
          "Aquí te sumergirás en la sintaxis básica de Dart. Aprenderás a escribir tu primer 'Hola, Mundo', declarar variables, usar tipos de datos primitivos y entender la estructura básica de un programa en Dart. ¡Es el punto de partida para escribir código funcional!",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 2,
      'title': 'Control de Flujo',
      'description':
          "En este nivel, aprenderás a controlar el flujo de ejecución de tu código en Dart. Explorarás el uso de condicionales (if, else, switch) para tomar decisiones y bucles (for, while, do-while) para repetir tareas. Estos conceptos son esenciales para crear lógica en tus programas y manejar diferentes escenarios de manera eficiente.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 3,
      'title': 'Funciones en Dart',
      'description':
          "Descubre cómo crear y usar funciones en Dart. Aprenderás a definir funciones, pasar parámetros, retornar valores y entender el concepto de ámbito (scope). Este nivel te ayudará a escribir código más organizado y reutilizable.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 4,
      'title': 'Colecciones en Dart',
      'description':
          "En este nivel, te familiarizarás con las colecciones en Dart: listas, mapas y conjuntos. Entenderás cómo se crean y manipulan estas estructuras de datos, esenciales para almacenar y gestionar información en tus programas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 5,
      'title': 'POO en Dart',
      'description':
          "Tus primeros pasos en la Programación Orientada a Objetos con Dart. Entenderás sobre clases, objetos, propiedades, métodos y constructores. Este nivel sentará las bases para entender conceptos más avanzados de POO.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 6,
      'title': 'Widgets Básicos',
      'description':
          "Un widget es un bloque de construcción fundamental en Flutter. Entenderemos los widgets principales y esenciales para construir preciosas interfaces de usuario.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 7,
      'title': 'Navegación Básica en Flutter',
      'description':
          "En este nivel, aprenderás a manejar la navegación entre pantallas en Flutter. Explorarás cómo usar push, pushReplacement, pop y pushNamed para moverte entre rutas. Además, entenderás cómo funciona la pila de navegación y cómo gestionarla para crear flujos de usuario intuitivos.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 8,
      'title': 'Ciclo de Vida de una App en Flutter',
      'description':
          "En este nivel, descubrirás cómo funciona el ciclo de vida de una aplicación en Flutter. Aprenderás sobre los métodos clave como initState, dispose, didChangeAppLifecycleState, y cómo usarlos para gestionar recursos, pausar o reanudar la aplicación, y responder a cambios en el estado de la app.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 9,
      'title': 'Tema Global en la App',
      'description':
          "Aprende a configurar y gestionar un tema global en Flutter, incluyendo colores, tipografías y estilos consistentes en toda la aplicación.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 10,
      'title': 'Asincronía en Dart',
      'description':
          "En este nivel, aprenderás cómo manejar la ejecución asíncrona en Dart. Descubrirás qué son los Future, cómo usar async/await para escribir código más claro y eficiente, y cómo funcionan los Stream para manejar datos en tiempo real. ¡Domina la asincronía y prepárate para construir aplicaciones dinámicas y fluidas!",
      'points': 0,
      'is_completed': 0,
    });
  }

  Future<void> _insertLevelsMid(db) async {
    await db.insert('level', {
      'module': 'Mid',
      'num_order': 1,
      'title': 'Persistencia de Datos',
      'description':
          "En este nivel verás cómo almacenar y gestionar datos directamente en el dispositivo móvil. Esto es crucial para aplicaciones que necesitan guardar información localmente, como preferencias del usuario, datos en caché o incluso bases de datos completas. Saber cómo manejar la persistencia de datos te permitirá crear aplicaciones que funcionen sin conexión y ofrezcan una experiencia más fluida a los usuarios.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 2,
      'title': 'Manejo de Errores y Excepciones',
      'description':
          "Aquí descubrirás cómo manejar situaciones inesperadas en tu aplicación, como errores de red, fallos en la lógica o problemas con los datos. Aprenderás a capturar y gestionar estos errores de manera elegante, evitando que la aplicación se cierre abruptamente. Este conocimiento es esencial para crear aplicaciones robustas y confiables, que no dejen a los usuarios colgados cuando algo sale mal.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 3,
      'title': 'Gestores de estado',
      'description':
          "En este nivel, explorarás cómo manejar el estado de tu aplicación de manera eficiente. El estado es la información que cambia con el tiempo, como el contenido de una lista o el tema de la aplicación. Aprenderás a organizar y actualizar esta información de forma que tu interfaz de usuario siempre refleje los datos correctos, sin complicar el código. Esto es clave para aplicaciones dinámicas y reactivas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 4,
      'title': 'Integración de APIs',
      'description':
          "Aquí te sumergirás en el mundo de las APIs, que son como puentes que conectan tu aplicación con servicios externos, como redes sociales, bases de datos en la nube o sistemas de pago. Aprenderás a obtener y enviar datos a través de estas APIs, lo que te permitirá crear aplicaciones que interactúan con el mundo exterior y ofrecen funcionalidades más ricas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 5,
      'title': 'Patrones de arquitectura',
      'description':
          "En este nivel, descubrirás cómo organizar el código de tu aplicación de manera que sea fácil de mantener, escalar y probar. Los patrones de arquitectura son como planos que te ayudan a estructurar tu proyecto, separando las responsabilidades y evitando que todo se convierta en un caos. Aprenderás a elegir el patrón adecuado para cada tipo de aplicación, lo que te convertirá en un desarrollador más estratégico.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 6,
      'title': 'Testing',
      'description':
          "Aquí aprenderás a escribir pruebas que verifiquen que tu aplicación funciona como debería. Las pruebas son como redes de seguridad que te permiten detectar errores antes de que lleguen a los usuarios. Aprenderás a cubrir diferentes aspectos de tu aplicación, desde funciones individuales hasta flujos completos, lo que te dará confianza para hacer cambios sin miedo a romper algo.",
      'points': 0,
      'is_completed': 0,
    });
  }

  Future<void> _insertLevelsSr(db) async {
    await db.insert('level', {
      'module': 'Sr',
      'num_order': 1,
      'title': 'Patrones de Diseño',
      'description':
          "En este nivel, profundizarás en los patrones de diseño, que son soluciones probadas para problemas comunes en el desarrollo de software. Aprenderás a aplicar patrones como Singleton, Factory y Observer para escribir código más modular, reutilizable y fácil de mantener. Estos patrones son esenciales para construir aplicaciones escalables y bien estructuradas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 2,
      'title': 'Optimización de rendimiento',
      'description':
          "Vas a descubrir cómo hacer que tu aplicación sea más rápida y eficiente. Aprenderás a identificar cuellos de botella, reducir el uso de memoria y mejorar la velocidad de carga. La optimización de rendimiento es crucial para aplicaciones que manejan grandes cantidades de datos o que necesitan funcionar sin problemas en dispositivos con recursos limitados.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 3,
      'title': 'Animaciones complejas',
      'description':
          "Entenderás todo sobre el mundo de las animaciones avanzadas, que pueden transformar la experiencia de usuario en algo mágico. Aprenderás a crear transiciones fluidas, efectos visuales impresionantes y animaciones interactivas que hagan que tu aplicación destaque. Este conocimiento es clave para aplicaciones que buscan ofrecer una interfaz de usuario moderna y atractiva.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 4,
      'title': 'Estrategias de testing',
      'description':
          "Aquí explorarás estrategias avanzadas de testing que te permitirán asegurar la calidad de tu aplicación en todos los niveles. Aprenderás a diseñar pruebas que cubran desde unidades de código individuales hasta flujos completos de usuario. Este conocimiento es esencial para garantizar que tu aplicación sea confiable y esté libre de errores críticos.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 5,
      'title': 'Integración de microservicios',
      'description':
          "En este nivel, aprenderás a conectar tu aplicación con microservicios, que son pequeñas piezas de software independientes que trabajan juntas para formar una aplicación más grande. Aprenderás a manejar la comunicación entre estos servicios, lo que te permitirá construir aplicaciones más escalables y fáciles de mantener.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 6,
      'title': 'WebSocket',
      'description':
          "Aquí te sumergirás en el uso de WebSockets, una tecnología que permite la comunicación en tiempo real entre el cliente y el servidor. Aprenderás a implementar funcionalidades como chats en vivo, notificaciones instantáneas y actualizaciones en tiempo real. Este conocimiento es esencial para aplicaciones que necesitan una interacción rápida y continua con el servidor.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 7,
      'title': 'Integración con plataformas nativas',
      'description':
          "En este nivel, explorarás cómo integrar funcionalidades nativas de Android e iOS en tu aplicación Flutter. Aprenderás a acceder a características específicas del dispositivo, como la cámara, el GPS o los sensores, lo que te permitirá crear aplicaciones más potentes y versátiles.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 8,
      'title': 'Arquitectura de Software a gran escala',
      'description':
          "Aquí aprenderás a diseñar y gestionar arquitecturas de software para aplicaciones grandes y complejas. Aprenderás a tomar decisiones estratégicas sobre cómo estructurar tu código, gestionar dependencias y asegurar la escalabilidad. Este conocimiento es crucial para liderar proyectos grandes y asegurar su éxito a largo plazo.",
      'points': 0,
      'is_completed': 0,
    });
  }
}
