

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_application/provider/task/task_notifier.dart';
import 'package:todo_application/provider/task/task_state.dart';

import '../../repositories/task_repository_provider.dart';


final tasksProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});