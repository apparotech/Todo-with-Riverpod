
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/utils/AppKeys.dart';
import 'package:todo_application/utils/task_keys.dart';

class TaskDataSource {
  static final TaskDataSource _instance = TaskDataSource();

  factory TaskDataSource() => _instance;

  static Database? _database;

  Future<Database> _initDb() async {
    final dpPath = await getDatabasesPath();
    final path = join(dpPath, 'task.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

  }

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  void _onCreate(Database db , int version) async {
    await db.execute('''
        CREATE TABLE ${AppKeys.dbTable} (
         ${TaskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
         ${TaskKeys.title} TEXT,
         ${TaskKeys.note} TEXT,
         ${TaskKeys.date} TEXT,
         ${TaskKeys.time} TEXT,
         ${TaskKeys.category} TEXT,
         ${TaskKeys.isCompleted} INTEGER
    )
    '''
    );
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

}