
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/provider/task/task_state.dart';
import 'package:todo_application/repositories/TaskRepository.dart';
 class TaskNotifier extends StateNotifier<TaskState> {

   final TaskRepository _repository;

   TaskNotifier(this._repository) : super(const TaskState.initial()) {
     getTask();
   }


Future<void> createTask(Task task)  async{

     try {
       await _repository.addTask(task);
       getTask();
     } catch (e) {
       debugPrint(e.toString());

     }
}


Future<void> deleteTask(Task task) async {

     try {
       await _repository.deleteTask(task);
       getTask();
     } catch(e) {
       debugPrint(e.toString());
     }
}


Future<void> updateTask (Task task) async {

     try {
       await _repository.updateTask(task);
       getTask();
     } catch (e) {
       debugPrint(e.toString());
     }
}



   void getTask() async {
     try {
       final task  = await _repository.getAllTasks();
       state = state.copyWith(tasks: task);
     } catch (e) {
       debugPrint(e.toString());
     }
   }





 }