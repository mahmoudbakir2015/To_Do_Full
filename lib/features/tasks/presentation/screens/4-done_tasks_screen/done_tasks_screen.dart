import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/core/widgets/fluuter_toast.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_states.dart';
import 'package:todo_application/features/tasks/presentation/controller/tasks_cubit/tasks_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/tasks_cubit/tasks_states.dart';
import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';
import "package:todo_application/features/tasks/presentation/widgets/list_view_builder.dart";

import '../../widgets/empty_data_base_body.dart';
import '../../widgets/empty_list_body.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<EditCubit, EditCubitStates>(
      listener: ((context, state) {
        if (state is DeleteTaskSuccessState) {
          showMyToast(message: "Task Removed successfully");
        }
        if (state is UpdateTaskSuccessState) {
          showMyToast(message: "Task Moved to ${state.movedTo}");
        }
        if (state is UpdateTaskFailedState || state is DeleteTaskFailedState) {
          showMyToast(
              message: "There is a problem , Please try again", isGreen: false);
        }
      }),
      child: BlocBuilder<TasksCubit, TasksStates>(
        builder: ((context, state) {
          return _chooseTheCorrectBody(state, context);
        }),
      ),
    );
  }

  Widget _chooseTheCorrectBody(TasksStates state, BuildContext context) {
    if (state is GetTasksSuccessState) {
      if (state.doneTasks.isEmpty) {
        return emptyListBody(listName: "done");
      } else {
        return buildListView(state.doneTasks, context);
      }
    } else if (state is GetTasksFailedState) {
      return noTasksAtDataBase();
    } else {
      return Center(
        child: CircularProgressIndicator(color: ColorManager.primary),
      );
    }
  }
}
