
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/utils/TaskCategory.dart';

final categoryProvider  = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.others;
});