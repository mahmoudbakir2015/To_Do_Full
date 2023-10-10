import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/task_entity.dart';

abstract class TaskReposatory {
  Future<Either<Failure, List<MyTask>>> getAllTasksTasks();
  Future<Either<Failure, Unit>> updateTask(
      {required MyTask task, required String attribute, required String value});
  Future<Either<Failure, Unit>> deleteTask({required int id});
  Future<Either<Failure, Unit>> addTask({required MyTask task});
}
