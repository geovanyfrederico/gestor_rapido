import 'package:sqflite/sqflite.dart';
import '../models/database_helper.dart';
import '../models/task_model.dart';

class TaskRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Task>> getAllTasks() async {
    final maps = await dbHelper.query('tasks');

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  Future<Task?> getTask(int id) async {
    final db = await dbHelper.database;

    final maps = await db.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task(
        id: maps.first['id'] as int,
        title: maps.first['title'] as String,
        description: maps.first['description'] as String,
        isCompleted: maps.first['isCompleted'] == 1,
      );
    }

    return null;
  }

  Future<int> addTask(Task task) async {
    final db = await dbHelper.database;

    return db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTask(Task task) async {
    final db = await dbHelper.database;

    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
