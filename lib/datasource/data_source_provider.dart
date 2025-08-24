

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/datasource/datasource.dart';

final taskDatasourceProvider = Provider<TaskDataSource>((ref) {
  return TaskDataSource();
});