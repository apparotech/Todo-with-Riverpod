import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/utils/extensions.dart';
import 'package:todo_application/widgets/CommonContainer.dart';

import '../Model/task.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false,
    required this.tasks
  });
  final bool isCompletedTasks;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksAlert = isCompletedTasks ?
        'There is no completed task yet'
     : 'There is no task to todo!';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
      ?Center(
        child: Text(
          emptyTasksAlert,
          style: context.textTheme.headlineSmall,
        ),
      )
          : ListView.separated(
        shrinkWrap: true,
          itemBuilder: (ctx, index) {
          final task = tasks[index];

          return InkWell(
            onTap: (){},


          );
          },

          itemCount: tasks.length,

            separatorBuilder: (context, index) => const Divider(
          thickness: 1.5,
        ),
      )

    );
  }
}
