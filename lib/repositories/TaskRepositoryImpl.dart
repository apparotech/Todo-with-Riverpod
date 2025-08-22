
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/datasource/datasource.dart';
import 'package:todo_application/repositories/TaskRepository.dart';

class TaskRepositoryImpl implements TaskRepository{
  final TaskDataSource _dataSource;
  TaskRepositoryImpl(this._dataSource);

  @override
  Future<void> addTask(Task task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(Task task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  
}