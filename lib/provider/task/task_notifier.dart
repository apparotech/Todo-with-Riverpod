
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/provider/task/task_state.dart';
import 'package:todo_application/repositories/TaskRepository.dart';

class TaskNotifier extends StateNotifier<TaskState> {
final  TaskRepository _repository;

TaskNotifier(this._repository) : super(const TaskState.initial()){

}


}