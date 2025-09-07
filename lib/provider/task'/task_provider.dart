

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/provider/task'/task_notifier.dart';
import 'package:todo_application/repositories/task_repository_provider.dart';



final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
})