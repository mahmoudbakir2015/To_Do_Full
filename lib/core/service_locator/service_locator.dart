import 'package:get_it/get_it.dart';
import 'package:todo_application/core/network/sqflite/sqflite_helper.dart';
import 'package:todo_application/features/tasks/data/tasks_data_source/local_data_source.dart';
import 'package:todo_application/features/tasks/data/tasks_reposatory_implementation/task_reposatory_impl.dart';
import 'package:todo_application/features/tasks/domain/reposatory/task_reposatory.dart';
import 'package:todo_application/features/tasks/domain/use_cases/add_task_usecase.dart';
import 'package:todo_application/features/tasks/domain/use_cases/delete_task_use_case.dart';
import 'package:todo_application/features/tasks/domain/use_cases/get_all_tasks_usecase.dart';
import 'package:todo_application/features/tasks/domain/use_cases/updateTaskUsecase.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/tasks_cubit/tasks_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/view_cubit/view_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    //MOVIESCUBIT
    getIt.registerFactory(() => TasksCubit(
          getAllTasksUseCase: getIt(),
        ));

    getIt.registerFactory(() => EditCubit(
          addTaskUseCase: getIt(),
          updateTaskUseCase: getIt(),
          deleteTaskUseCase: getIt(),
        ));

    getIt.registerFactory(() => ViewCubit());
    //USECASES
    getIt.registerLazySingleton(
        () => GetAllTasksUseCase(taskReposatory: getIt()));
    getIt.registerLazySingleton(
        () => UpdateTaskUseCase(taskReposatory: getIt()));
    getIt.registerLazySingleton(
        () => DeleteTaskUseCase(taskReposatory: getIt()));
    getIt.registerLazySingleton(() => AddTaskUseCase(taskReposatory: getIt()));

    //REPOSITORY
    getIt.registerLazySingleton<TaskReposatory>(
        () => TaskReposatoryImpl(localDataSource: getIt()));

    //DATA SOURCE
    //WHEN I CALL BASE OR NOT BASE IT WILL USE THE SAME OBJECT
    getIt.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(sqfliteHelper: getIt()));

    //helpers
    getIt.registerLazySingleton<SqfliteHelper>(() => SqfliteHelperImpl());
  }
}
