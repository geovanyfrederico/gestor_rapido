import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  late Database _database =  _initDatabase() as Database;

  DatabaseHelper._init();

  Future<Database> _initDatabase() async {
    _database = await _initDB('tasks.db');
    return _database;
  }

  Future<Database> get database async {
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT
          isCompleted BIT NOT NULL
       )
    ''');
  }
  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await instance.database;
    return db.query(table);
  }
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert(table, data);
  }
  Future<int> update(String table, Map<String, dynamic> data) async {
    final db = await instance.database;

    return await db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }
  Future<int> delete(String table, int id) async {
    final db = await instance.database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

