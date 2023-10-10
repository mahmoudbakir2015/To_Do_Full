import 'package:todo_application/core/error/exceptions.dart';
import 'package:todo_application/core/error/failure_messages.dart';
import 'package:todo_application/features/tasks/data/tasks_data_source/local_data_source.dart';
import 'package:todo_application/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_application/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_application/features/tasks/domain/reposatory/task_reposatory.dart';

class TaskReposatoryImpl implements TaskReposatory{
  LocalDataSource localDataSource;
  TaskReposatoryImpl({required this.localDataSource});
  Future<Either<Failure,List<MyTask>>> getAllTasksTasks()async{
    try{
      List<MyTask> tasks = await localDataSource.getAllTasks();
      return Right(tasks);
    }on EmptyTasksException{
      return Left(EmptyTasksFailure(
        message: FailureMessages.emptyTasksMessage,
        ));
    }
  }
  Future<Either<Failure,Unit>>updateTask({required MyTask task , required String attribute , required String value})async{
    try{
      await localDataSource.updateTask(task: task , attribute : attribute , value:value);
      return Right(unit);
    }on UpdateTaskException{
      return Left(
        UpdateTaskFailure(message:FailureMessages.updateTaskFailedMessage),
      );
    }
  }
  Future<Either<Failure,Unit>>deleteTask({required int id})async{
    try{
      await localDataSource.deleteTask(id: id);
      return Right(unit);
    }on DeleteTaskException{
      return Left(
        DeleteTaskFailure(message:FailureMessages.deleteTaskFailedMessage),
        );
      }
    }
  
  Future<Either<Failure,Unit>>addTask({required MyTask task})async{
    try{
      await localDataSource.addTask(task: task);
      return Right(unit);
    }on AddTaskException{
      return Left(
        AddTaskFailure(message:FailureMessages.addTaskFailedMessage),
        );
      }
    }
  }
   
  
