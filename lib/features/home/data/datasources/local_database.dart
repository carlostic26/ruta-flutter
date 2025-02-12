import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'ruta_flutter_4.db'), version: 1,
        onCreate: (db, version) async {
      /* se debe inicializar la bd en el main
          final dbHelper = LocalDatabaseHelper();
  await dbHelper.insertInitialData();


        */

      //TODO: crear tabla topic, subtopic, detail

      // tabla level
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

      // tabla topic
      await db.execute('''
        CREATE TABLE topic(
          id TEXT PRIMARY KEY,
          level_id INTEGER,
          title TEXT,
          FOREIGN KEY (level_id) REFERENCES level(id) ON DELETE CASCADE
        );
      ''');

      // tabla subtopic
      await db.execute('''
        CREATE TABLE subtopic(
          id TEXT PRIMARY KEY,
          topic_id TEXT,
          title TEXT,
          FOREIGN KEY (topic_id) REFERENCES topic(id) ON DELETE CASCADE
        );
      ''');

/*       // tabla detail
      await db.execute('''
        CREATE TABLE detail(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          id TEXT,          
          definition TEXT,
          code_example TEXT,
          img_url TEXT,
          FOREIGN KEY (id) REFERENCES subtopic(id) ON DELETE CASCADE
        );
      '''); */

      await _insertLevelsJr(db);
      await _insertLevelsMid(db);
      await _insertLevelsSr(db);

      await _insertTopics(db);
      await insertSubtopics(db);
    });
  }

  Future<void> _insertLevelsJr(db) async {
    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 1, "Sintaxis Básica de Dart", "Aquí te sumergirás en la sintaxis básica de Dart. Aprenderás a escribir tu primer 'Hola, Mundo', declarar variables, usar tipos de datos primitivos y entender la estructura básica de un programa en Dart. ¡Es el punto de partida para escribir código funcional!", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 2, "Ciclo de Vida de una Aplicación en Flutter", "En este nivel, descubrirás cómo funciona el ciclo de vida de una aplicación en Flutter. Aprenderás sobre los métodos clave como initState, dispose, didChangeAppLifecycleState, y cómo usarlos para gestionar recursos, pausar o reanudar la aplicación, y responder a cambios en el estado de la app.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 3, "Control de Flujo", "En este nivel, aprenderás a controlar el flujo de ejecución de tu código en Dart. Explorarás el uso de condicionales (if, else, switch) para tomar decisiones y bucles (for, while, do-while) para repetir tareas. Estos conceptos son esenciales para crear lógica en tus programas y manejar diferentes escenarios de manera eficiente.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 4, "Widgets Básicos", "Un widget es un bloque de construcción fundamental en Flutter. Entenderemos los widgets principales y esenciales para construir preciosas interfaces de usuario.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 5, "Navegación Básica en Flutter", "En este nivel, aprenderás a manejar la navegación entre pantallas en Flutter. Explorarás cómo usar push, pushReplacement, pop y pushNamed para moverte entre rutas. Además, entenderás cómo funciona la pila de navegación y cómo gestionarla para crear flujos de usuario intuitivos.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 6, "Funciones en Dart", "Descubre cómo crear y usar funciones en Dart. Aprenderás a definir funciones, pasar parámetros, retornar valores y entender el concepto de ámbito (scope). Este nivel te ayudará a escribir código más organizado y reutilizable.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 7, "Colecciones en Dart", "En este nivel, te familiarizarás con las colecciones en Dart: listas, mapas y conjuntos. Entenderás cómo se crean y manipulan estas estructuras de datos, esenciales para almacenar y gestionar información en tus programas.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 8, "Asincronía en Dart", "En este nivel, aprenderás cómo manejar la ejecución asíncrona en Dart. Descubrirás qué son los Future, cómo usar async/await para escribir código más claro y eficiente, y cómo funcionan los Stream para manejar datos en tiempo real. ¡Domina la asincronía y prepárate para construir aplicaciones dinámicas y fluidas!", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 9, "Tema Global en la App", "Aprende a configurar y gestionar un tema global en Flutter, incluyendo colores, tipografías y estilos consistentes en toda la aplicación.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Jr", 10, "POO en Dart", "Tus primeros pasos en la Programación Orientada a Objetos con Dart. Entenderás sobre clases, objetos, propiedades, métodos y constructores. Este nivel sentará las bases para entender conceptos más avanzados de POO.", 0, 0)
      ''');
  }

  Future<void> _insertLevelsMid(db) async {
    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Mid", 1, "Persistencia de Datos", "En este nivel verás cómo almacenar y gestionar datos directamente en el dispositivo móvil. Esto es crucial para aplicaciones que necesitan guardar información localmente, como preferencias del usuario, datos en caché o incluso bases de datos completas. Saber cómo manejar la persistencia de datos te permitirá crear aplicaciones que funcionen sin conexión y ofrezcan una experiencia más fluida a los usuarios.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Mid", 2, "Manejo de Errores y Excepciones", "Aquí descubrirás cómo manejar situaciones inesperadas en tu aplicación, como errores de red, fallos en la lógica o problemas con los datos. Aprenderás a capturar y gestionar estos errores de manera elegante, evitando que la aplicación se cierre abruptamente. Este conocimiento es esencial para crear aplicaciones robustas y confiables, que no dejen a los usuarios colgados cuando algo sale mal.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Mid", 3, "Gestores de estado", "En este nivel, explorarás cómo manejar el estado de tu aplicación de manera eficiente. El estado es la información que cambia con el tiempo, como el contenido de una lista o el tema de la aplicación. Aprenderás a organizar y actualizar esta información de forma que tu interfaz de usuario siempre refleje los datos correctos, sin complicar el código. Esto es clave para aplicaciones dinámicas y reactivas.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Mid", 4, "Integración de APIs", "Aquí te sumergirás en el mundo de las APIs, que son como puentes que conectan tu aplicación con servicios externos, como redes sociales, bases de datos en la nube o sistemas de pago. Aprenderás a obtener y enviar datos a través de estas APIs, lo que te permitirá crear aplicaciones que interactúan con el mundo exterior y ofrecen funcionalidades más ricas.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Mid", 5, "Patrones de arquitectura", "En este nivel, descubrirás cómo organizar el código de tu aplicación de manera que sea fácil de mantener, escalar y probar. Los patrones de arquitectura son como planos que te ayudan a estructurar tu proyecto, separando las responsabilidades y evitando que todo se convierta en un caos. Aprenderás a elegir el patrón adecuado para cada tipo de aplicación, lo que te convertirá en un desarrollador más estratégico.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Mid", 6, "Testing", "Aquí aprenderás a escribir pruebas que verifiquen que tu aplicación funciona como debería. Las pruebas son como redes de seguridad que te permiten detectar errores antes de que lleguen a los usuarios. Aprenderás a cubrir diferentes aspectos de tu aplicación, desde funciones individuales hasta flujos completos, lo que te dará confianza para hacer cambios sin miedo a romper algo.", 0, 0)
      ''');
  }

  Future<void> _insertLevelsSr(db) async {
    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 1, "Patrones de Diseño", "En este nivel, profundizarás en los patrones de diseño, que son soluciones probadas para problemas comunes en el desarrollo de software. Aprenderás a aplicar patrones como Singleton, Factory y Observer para escribir código más modular, reutilizable y fácil de mantener. Estos patrones son esenciales para construir aplicaciones escalables y bien estructuradas.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 2, "Optimización de rendimiento", "Vas a descubrir cómo hacer que tu aplicación sea más rápida y eficiente. Aprenderás a identificar cuellos de botella, reducir el uso de memoria y mejorar la velocidad de carga. La optimización de rendimiento es crucial para aplicaciones que manejan grandes cantidades de datos o que necesitan funcionar sin problemas en dispositivos con recursos limitados.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 3, "Animaciones complejas", "Entenderás todo sobre el mundo de las animaciones avanzadas, que pueden transformar la experiencia de usuario en algo mágico. Aprenderás a crear transiciones fluidas, efectos visuales impresionantes y animaciones interactivas que hagan que tu aplicación destaque. Este conocimiento es clave para aplicaciones que buscan ofrecer una interfaz de usuario moderna y atractiva.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 4, "Estrategias de testing", "Aquí explorarás estrategias avanzadas de testing que te permitirán asegurar la calidad de tu aplicación en todos los niveles. Aprenderás a diseñar pruebas que cubran desde unidades de código individuales hasta flujos completos de usuario. Este conocimiento es esencial para garantizar que tu aplicación sea confiable y esté libre de errores críticos.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 5, "Integración de microservicios", "En este nivel, aprenderás a conectar tu aplicación con microservicios, que son pequeñas piezas de software independientes que trabajan juntas para formar una aplicación más grande. Aprenderás a manejar la comunicación entre estos servicios, lo que te permitirá construir aplicaciones más escalables y fáciles de mantener.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 6, "WebSocket", "Aquí te sumergirás en el uso de WebSockets, una tecnología que permite la comunicación en tiempo real entre el cliente y el servidor. Aprenderás a implementar funcionalidades como chats en vivo, notificaciones instantáneas y actualizaciones en tiempo real. Este conocimiento es esencial para aplicaciones que necesitan una interacción rápida y continua con el servidor.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 7, "Integración con plataformas nativas", "En este nivel, explorarás cómo integrar funcionalidades nativas de Android e iOS en tu aplicación Flutter. Aprenderás a acceder a características específicas del dispositivo, como la cámara, el GPS o los sensores, lo que te permitirá crear aplicaciones más potentes y versátiles.", 0, 0)
      ''');

    await db.execute('''
        INSERT INTO level(module, num_order, title, description, points, is_completed) VALUES
        ("Sr", 8, "Arquitectura de Software a gran escala", "Aquí aprenderás a diseñar y gestionar arquitecturas de software para aplicaciones grandes y complejas. Aprenderás a tomar decisiones estratégicas sobre cómo estructurar tu código, gestionar dependencias y asegurar la escalabilidad. Este conocimiento es crucial para liderar proyectos grandes y asegurar su éxito a largo plazo.", 0, 0)
      ''');
  }

  Future<void> _insertTopics(db) async {
    // Nivel 1
    await db.insert('topic', {
      'id': 't1n1',
      'level_id': 1,
      'title': 'Variables y Tipos de Datos',
    });

    await db.insert('topic', {
      'id': 't2n1',
      'level_id': 1,
      'title': 'Funciones en Dart',
    });

    // Nivel 2
    await db.insert('topic', {
      'id': 't1n2',
      'level_id': 2,
      'title': 'Ciclo de Vida de Widgets',
    });

    // Nivel 2
    await db.insert('topic', {
      'id': 't1n2',
      'level_id': 2,
      'title': 'Ciclo de Vida de Widgets',
    });
  }

  Future<void> insertSubtopics(db) async {
    // Evaluar si es necesario etiquetar en codigo al nivel desde detail para poder diferenciar por ej s1t1 de los otros niveles

    // Topic 1 - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't1n1', //id de donde viene (Topic 1 del nivel 1)
      'id': 's1t1', //id de subtopic actual (Subtopic 1 del topic 1)
      'title': 'Declaración de Variables',
    });

    await db.insert('subtopic', {
      'topic_id': 't1n1',
      'id': 's2t1',
      'title': 'Tipos de Datos Primitivos',
    });

    // Topic 2 - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't2n1',
      'id': 's1t2',
      'title': 'Funciones Básicas',
    });

    await db.insert('subtopic', {
      'topic_id': 't2n1',
      'id': 's2t2',
      'title': 'Parámetros y Retorno',
    });

    // Insertar subtemas para el tema 3 (initState y dispose)
    await db.insert('subtopic', {
      'topic_id': 't3n1',
      'id': 's1t3',
      'title': 'Uso de initState',
    });
  }
  //TODO: INSERT  detail
}




/*
Future<void> insertDetails() async {
  final db = await _initDatabase();

  // Insertar descripción para el subtema 1 (Declaración de Variables)
  await db.insert('detail', {
    'id': 1, // Relacionado con el subtema 1
    'title': 'Declaración de Variables',
    'detail': 'En Dart, las variables se declaran usando la palabra clave `var` o un tipo específico.',
    'code_example': 'var nombre = "Juan";\nint edad = 25;',
  });

  // Insertar descripción para el subtema 2 (Tipos de Datos Primitivos)
  await db.insert('detail', {
    'id': 2, // Relacionado con el subtema 2
    'title': 'Tipos de Datos Primitivos',
    'detail': 'Dart tiene varios tipos de datos primitivos, como `int`, `double`, `String`, y `bool`.',
    'code_example': 'int numero = 10;\ndouble precio = 19.99;\nString nombre = "Ana";\nbool esActivo = true;',
  });

  // Insertar descripción para el subtema 3 (Funciones Básicas)
  await db.insert('detail', {
    'id': 3, // Relacionado con el subtema 3
    'title': 'Funciones Básicas',
    'detail': 'En Dart, las funciones se definen usando la palabra clave `void` si no devuelven un valor.',
    'code_example': 'void saludar() {\n  print("Hola, Mundo!");\n}',
  });

  // Insertar descripción para el subtema 4 (Parámetros y Retorno)
  await db.insert('detail', {
    'id': 4, // Relacionado con el subtema 4
    'title': 'Parámetros y Retorno',
    'detail': 'Las funciones en Dart pueden recibir parámetros y devolver valores usando `return`.',
    'code_example': 'int sumar(int a, int b) {\n  return a + b;\n}',
  });
}
*/