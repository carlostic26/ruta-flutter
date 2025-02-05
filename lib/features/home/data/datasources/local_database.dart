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
    return await openDatabase(
      join(dbPath, 'ruta_flutter_1.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE level(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          module TEXT,
          title TEXT,
          description TEXT,
          points INTEGER
        );
      ''');

        await db.execute('''
        INSERT INTO level(module, title, description, points) VALUES
        ("Jr", "title1 jr", "description1", 0), 
        ("Jr", "title2", "description2", 0), 
        ("Jr", "title3", "description3", 0), 
        ("Jr", "title4", "description4", 0), 
        ("Jr", "title5", "description5", 0), 
        ("Jr", "title6", "description6", 0), 
        ("Jr", "title7", "description7", 0),
        ("Mid", "title1 mid", "description1", 0), 
        ("Mid", "title2", "description2", 0), 
        ("Mid", "title3", "description3", 0), 
        ("Mid", "title4", "description4", 0), 
        ("Mid", "title5", "description5", 0), 
        ("Mid", "title6", "description6", 0), 
        ("Mid", "title7", "description7", 0),
        ("Sr", "title1 sr", "description1", 0), 
        ("Sr", "title2", "description2", 0), 
        ("Sr", "title3", "description3", 0), 
        ("Sr", "title4", "description4", 0), 
        ("Sr", "title5", "description5", 0), 
        ("Sr", "title6", "description6", 0), 
        ("Sr", "title7", "description7", 0);
      ''');
      },
    );
  }
}
