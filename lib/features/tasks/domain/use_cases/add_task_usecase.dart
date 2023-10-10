import 'package:dartz/dartz.dart';
import 'package:todo_application/core/error/failures.dart';
import 'package:todo_application/features/tasks/domain/reposatory/task_reposatory.dart';

import '../entities/task_entity.dart';

class AddTaskUseCase{
  TaskReposatory taskReposatory;
  AddTaskUseCase({required this.taskReposatory});

  Future<Either<Failure, Unit>> excute(MyTask task)async{
    return await taskReposatory.addTask(task: task);
  }
}