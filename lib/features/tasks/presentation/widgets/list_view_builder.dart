import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/tasks_cubit/tasks_cubit.dart';
import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';

import '../../domain/entities/task_entity.dart';

Future<void> deleteTaskInstructions(context, MyTask task) async {
  await EditCubit.get(context).deleteTask(task.id!);
  await TasksCubit.get(context).getTasksFromCubit();
}

Future<void> moveTaskToDoneInstructions(context, MyTask task) async {
  await EditCubit.get(context).moveTaskToDoneFromCubit(task: task);
  await TasksCubit.get(context).getTasksFromCubit();
}

Future<void> moveRaskToArchivedTaskInstructions(context, MyTask task) async {
  await EditCubit.get(context).moveTaskToArchivedFromCubit(task: task);
  await TasksCubit.get(context).getTasksFromCubit();
}

ListView buildListView(List<MyTask> tasksToBeBuild, context) =>
    ListView.separated(
      itemBuilder: ((context, index) =>
          _buildItem(tasksToBeBuild, tasksToBeBuild[index], context)),
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Container(
            height: 1,
            width: double.infinity,
            color: ColorManager.grey,
          ),
        );
      },
      itemCount: tasksToBeBuild.length,
    );

Slidable _buildItem(List<MyTask> tasksToBeBuild, MyTask task, context) {
  return Slidable(
    key: ValueKey(task.id),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () async {
          await deleteTaskInstructions(context, task);
        },
      ),
      children: [
        SlidableAction(
          icon: Icons.delete,
          backgroundColor: Colors.red,
          label: "Delete",
          onPressed: (context) async {
            await deleteTaskInstructions(context, task);
          },
        ),
      ],
    ),
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        if (task.isDone == "no")
          SlidableAction(
            icon: Icons.download_done_outlined,
            backgroundColor: Colors.green,
            label: "Done",
            onPressed: (context) async {
              await moveTaskToDoneInstructions(context, task);
            },
          ),
        SlidableAction(
          icon: Icons.delete,
          backgroundColor: Colors.red,
          label: "Delete",
          onPressed: (context) async {
            await deleteTaskInstructions(context, task);
          },
        ),
        if (task.isArc == "no")
          SlidableAction(
            icon: Icons.archive_rounded,
            backgroundColor: ColorManager.grey,
            label: "Archive",
            onPressed: (context) async {
              await moveRaskToArchivedTaskInstructions(context, task);
            },
          ),
      ],
    ),
    child: Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.primary,
              radius: 45,
              child: Text(
                "${task.time}",
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "${task.content}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "Due to  ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${task.date}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
