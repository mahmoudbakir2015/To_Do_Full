import 'package:dartz/dartz.dart';
import 'package:todo_application/core/error/failures.dart';
import 'package:todo_application/features/tasks/domain/reposatory/task_reposatory.dart';

import '../entities/task_entity.dart';

class UpdateTaskUseCase{
  TaskReposatory taskReposatory;
  UpdateTaskUseCase({required this.taskReposatory});

  Future<Either<Failure, Unit>> excute({required MyTask task , required String attribute , required String value})async{
    return await taskReposatory.updateTask(task: task , attribute : attribute , value:value);
  }
}