import 'package:dartz/dartz.dart';
import 'package:todo_application/core/error/exceptions.dart';
import 'package:todo_application/core/network/sqflite/sqflite_helper.dart';
import 'package:todo_application/features/tasks/data/model/task_model.dart';

import '../../domain/entities/task_entity.dart';

abstract class LocalDataSource {
  Future<List<TaskModel>> getAllTasks();
  Future<Unit> updateTask(
      {required MyTask task, required String attribute, required String value});
  Future<Unit> deleteTask({required int id});
  Future<Unit> addTask({required MyTask task});
}

class LocalDataSourceImpl implements LocalDataSource {
  SqfliteHelper sqfliteHelper;
  LocalDataSourceImpl({required this.sqfliteHelper});

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final List<Map<String, dynamic>> tasksOrFailure =
        await sqfliteHelper.readData("SELECT * FROM 'myTasks'");
    if (!tasksOrFailure.isEmpty) {
      List<TaskModel> tasks = [];
      tasksOrFailure.forEach((element) {
        tasks.add(TaskModel.fromMap(element));
      });
      return tasks;
    } else {
      throw EmptyTasksException();
    }
  }

  @override
  Future<Unit> addTask({required MyTask task}) async {
    int response = await sqfliteHelper.insertData(
        'INSERT INTO myTasks(content ,  date , time , isDone , isArc) VALUES ("${task.content}" , "${task.date}" , "${task.time}" , "no" , "no" )');
    return checkResponseOfUpdatePostDelete(
      response: response,
    );
  }

  @override
  Future<Unit> deleteTask({required int id}) async {
    int response =
        await sqfliteHelper.deleteData("DELETE FROM 'myTasks' WHERE id=$id ");
    return checkResponseOfUpdatePostDelete(
      response: response,
      isDelete: true,
    );
  }

  @override
  Future<Unit> updateTask(
      {required MyTask task,
      required String attribute,
      required String value}) async {
    int response = await sqfliteHelper.updateData(
        "UPDATE 'myTasks' SET '$attribute'='$value' WHERE id = ${task.id} ");

    return checkResponseOfUpdatePostDelete(
      response: response,
      isUpdate: true,
    );
  }

  //To CHOOSE THE CORRECT EXCEPTION INSTEAD OF CHECK EVERY TIME
  Unit checkResponseOfUpdatePostDelete(
      {required int response, bool isUpdate = false, bool isDelete = false}) {
    if (response != 0) {
      return unit;
    } else {
      if (isUpdate) {
        throw UpdateTaskException();
      } else if (isDelete) {
        throw DeleteTaskException();
      } else {
        throw AddTaskException();
      }
    }
  }
}
