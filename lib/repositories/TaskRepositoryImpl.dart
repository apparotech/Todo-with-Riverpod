
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/datasource/datasource.dart';
import 'package:todo_application/repositories/TaskRepository.dart';

class TaskRepositoryImpl implements TaskRepository{
  final TaskDataSource _dataSource;
  TaskRepositoryImpl(this._dataSource);

  @override
  Future<void> addTask(Task task)  async{
     try {
       await _dataSource.addTask(task);
     } catch (e) {
       throw '$e';
     }
  }

  @override
  Future<void> deleteTask(Task task) async{
    try {
       await _dataSource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks()  async{
      try {
        return  await _dataSource.getAllTasks();
      } catch(e) {
        throw'$e';
      }
  }

  @override
  Future<void> updateTask(Task task) async {
      try {
        await _dataSource.updateTask(task);
      } catch (e) {
        throw'e';
      }
  }
  
  
}