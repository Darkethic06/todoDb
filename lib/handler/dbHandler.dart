import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tododb/model/todo.dart';

class Databasehandler {
  Database? _database;

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    const dbName = 'todo.db';
    final path = join(dbPath, dbName);
    _database = await openDatabase(path, version: 1, onCreate: createDB);
    return _database!;
  }

  Future<void> createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE todo(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      todoText TEXT,
      creationDate TEXT,
      isDone INTEGER
    )
  ''');
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;
    await db.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTodo() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('todo');
    return List.generate(
        items.length,
        (i) => Todo(
            id: items[i]['id'],
            todoText: items[i]['todoText'],
            creationDate: DateTime.parse(items[i]['creationDate']),
            isDone: items[i]['isDone'] == 1 ? true : false));
  }
}
