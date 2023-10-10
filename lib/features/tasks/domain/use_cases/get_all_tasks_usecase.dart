import 'package:dartz/dartz.dart';
import 'package:todo_application/core/error/failures.dart';
import 'package:todo_application/features/tasks/domain/reposatory/task_reposatory.dart';

import '../entities/task_entity.dart';

class GetAllTasksUseCase {
  TaskReposatory taskReposatory;
  GetAllTasksUseCase({required this.taskReposatory});

  Future<Either<Failure, List<MyTask>>> excute() async {
    return await taskReposatory.getAllTasksTasks();
  }
}
