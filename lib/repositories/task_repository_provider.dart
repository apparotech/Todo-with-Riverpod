

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/datasource/data_source_provider.dart';
import 'package:todo_application/repositories/TaskRepository.dart';
import 'package:todo_application/repositories/TaskRepositoryImpl.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.read(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
