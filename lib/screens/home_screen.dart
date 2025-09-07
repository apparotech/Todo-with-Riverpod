import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/provider/dateProvider.dart';
import 'package:todo_application/utils/extensions.dart';
import 'package:todo_application/widgets/app_background.dart';
import 'package:todo_application/widgets/display_list_of_tasks.dart';
import 'package:todo_application/widgets/display_white_text.dart';
import 'package:todo_application/widgets/helpers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(tasksProvider);
    final inCompletedTasks = _incompltedTask(, ref)
    final date = ref.watch(dateProvider);
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            headerHeight: deviceSize.height * 0.3,
            header: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: DisplayWhiteText(
                        text: Helpers.dateFomatmatter(date),
                        fontWeight: FontWeight.normal,
                      
                    )
                  ),
                  const DisplayWhiteText(text: 'My Todo List,', size: 40)
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
              left: 0,
              right: 0,

              child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DisplayListOfTasks(tasks: _incompltedTask(tasks, ref))
                      ],
                    ),
                  )
              )
          )
        ],
      ),
    );
  }

  List<Task> _incompltedTask(List<Task> tasks , WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for(var task in tasks) {
      if(!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if(isTaskDay){
          filteredTask.add(task);
        }
      }
    }

    return filteredTask;
  }


}
