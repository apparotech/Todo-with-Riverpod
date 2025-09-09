import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/provider/dateProvider.dart';
import 'package:todo_application/provider/task/tasks_provider.dart';
import 'package:todo_application/screens/create_task_screen.dart';
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
   final date = ref.watch(dateProvider);
   final taskState = ref.watch(tasksProvider);
    final inCompletedTasks = _incompltedTask(taskState.tasks, ref);
    final completedTasks = _compltedTask(taskState.tasks, ref);



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
                        DisplayListOfTasks(tasks: inCompletedTasks),

                        const Gap(20),
                        Text('Completed',
                          style:  context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(20),
                        DisplayListOfTasks(
                            isCompletedTasks: true,
                            tasks: completedTasks
                        ),
                        
                        const Gap(20),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => CreateTaskScreen())
                              );
                            },
                            child: const Padding(
                                padding: EdgeInsets.all(8.0),
                              child: DisplayWhiteText(text: 'Add New Task', ),
                            )
                        )
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

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask =[];

    for(var task in tasks) {
       if(task.isCompleted) {
         final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
         if(isTaskDay) {
           filteredTask.add(task);
         }
       }
    }

    return filteredTask;
  }

}
