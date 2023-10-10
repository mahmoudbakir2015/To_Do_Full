import 'package:todo_application/features/tasks/domain/entities/task_entity.dart';

// ignore: must_be_immutable
class TaskModel extends MyTask {
  TaskModel(
      {required super.id,
      required super.date,
      required super.time,
      required super.content,
      required super.isArc,
      required super.isDone});

  factory TaskModel.fromMap(Map<String, dynamic> taskFromDataBase) {
    return TaskModel(
      id: taskFromDataBase["id"],
      date: taskFromDataBase["date"],
      time: taskFromDataBase["time"],
      content: taskFromDataBase["content"],
      isArc: taskFromDataBase["isArc"],
      isDone: taskFromDataBase["isDone"],
    );
  }
}
