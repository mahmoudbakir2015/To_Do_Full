import 'package:dartz/dartz.dart';
import 'package:todo_application/core/error/failures.dart';
import 'package:todo_application/features/tasks/domain/reposatory/task_reposatory.dart';

class DeleteTaskUseCase{
  TaskReposatory taskReposatory;
  DeleteTaskUseCase({required this.taskReposatory});

  Future<Either<Failure,Unit>> excute(int id)async{
    return await taskReposatory.deleteTask(id: id);
  }
}