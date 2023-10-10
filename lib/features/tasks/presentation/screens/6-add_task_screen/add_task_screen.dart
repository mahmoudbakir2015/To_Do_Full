import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/core/widgets/fluuter_toast.dart';
import 'package:todo_application/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_states.dart';
import 'package:todo_application/features/tasks/presentation/controller/tasks_cubit/tasks_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/view_cubit/view_states.dart';

import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';
import 'package:todo_application/features/tasks/presentation/widgets/text_form_field.dart';

import '../../controller/view_cubit/view_cubit.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditCubit, EditCubitStates>(
      listener: ((context, state) async {
        if (state is AddTaskSuccessState) {
          ViewCubit.get(context).contentController.clear();
          ViewCubit.get(context).dateController.clear();
          ViewCubit.get(context).timeController.clear();
          Navigator.pop(context);
          showMyToast(message: "Task added Successfully");
          await TasksCubit.get(context).getTasksFromCubit();
        }
        if (state is AddTaskFailedState) {
          showMyToast(message: "Please try again", isGreen: false);
        }
      }),
      child: Scaffold(appBar: _getAppBar(), body: _getBody(context)),
    );
  }

  SingleChildScrollView _getBody(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              defultFormField(
                controller: ViewCubit.get(context).contentController,
                validate: ((value) {
                  if (value == null || value.trim().length == 0) {
                    return "This field is required";
                  }
                  return null;
                }),
                labeltext: "Content",
                prefix: Icon(
                  Icons.title_outlined,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<ViewCubit, ViewCubitStates>(
                builder: (context, state) {
                  return defultFormField(
                    ontap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2025-05-03'),
                      );
                      if (date != null) {
                        ViewCubit.get(context).dateController.text =
                            DateFormat.yMMMd().format(date);
                        ViewCubit.get(context).refreshWidgets();
                      }
                    },
                    controller: ViewCubit.get(context).dateController,
                    validate: ((value) {
                      if (value == null || value.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    }),
                    labeltext: "date",
                    prefix: Icon(
                      Icons.date_range,
                      color: ColorManager.primary,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<ViewCubit, ViewCubitStates>(
                builder: (context, state) {
                  return defultFormField(
                    controller: ViewCubit.get(context).timeController,
                    ontap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (time != null) {
                        ViewCubit.get(context).timeController.text =
                            time.format(context);
                        ViewCubit.get(context).refreshWidgets();
                      }
                    },
                    validate: ((value) {
                      if (value == null || value.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    }),
                    labeltext: "time",
                    prefix: Icon(
                      Icons.title_outlined,
                      color: ColorManager.primary,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (formKey.currentState!.validate() &&
                      formKey.currentState != null) {
                    await EditCubit.get(context).addTaskFromCubit(
                      task: MyTask(
                        date: ViewCubit.get(context).dateController.text,
                        time: ViewCubit.get(context).timeController.text,
                        content: ViewCubit.get(context).contentController.text,
                        isArc: "no",
                        isDone: "no",
                      ),
                    );
                  }
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: BlocBuilder<EditCubit, EditCubitStates>(
                      builder: ((context, state) {
                        if (state is AddTaskLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.white,
                            ),
                          );
                        } else {
                          return Text(
                            "Add The Task",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorManager.primary,
      centerTitle: true,
      title: Text("Add Task"),
    );
  }
}
