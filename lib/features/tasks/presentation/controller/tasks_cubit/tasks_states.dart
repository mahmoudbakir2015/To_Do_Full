import '../../../domain/entities/task_entity.dart';

abstract class TasksStates {}

class IntialStateOfTasksCubit extends TasksStates {}

class GetTasksSuccessState extends TasksStates {
  List<MyTask> newTasks = [];
  List<MyTask> doneTasks = [];
  List<MyTask> archivedTasks = [];

  GetTasksSuccessState({
    required this.newTasks,
    required this.doneTasks,
    required this.archivedTasks,
  });
}

class GetTasksFailedState extends TasksStates {
  final String message;
  GetTasksFailedState({required this.message});
}

class GetTasksLoadingState extends TasksStates {}
