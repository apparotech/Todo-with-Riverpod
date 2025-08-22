
import 'package:equatable/equatable.dart';

import '../utils/TaskCategory.dart';
import '../utils/task_keys.dart';

class Task  {

  final int id;
  final String title;
  final String note;
  final TaskCategory category;
  final String time;
  final String date;
  final bool isCompleted;


  const Task({
    required this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.date,
    required this.note,
    required this.isCompleted,

});


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.category: category.name,
      TaskKeys.time: time,
      TaskKeys.date: date,
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      note: map[TaskKeys.note],
      category: TaskCategory.stringToTaskCategory(map[TaskKeys.category]),
      time: map[TaskKeys.time],
      date: map[TaskKeys.date],
      isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }
  



}