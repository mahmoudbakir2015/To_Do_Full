import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/core/error/failures.dart';
import 'package:todo_application/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_application/features/tasks/domain/use_cases/get_all_tasks_usecase.dart';
import 'package:todo_application/features/tasks/presentation/controller/tasks_cubit/tasks_states.dart';

class TasksCubit extends Cubit<TasksStates>{
  GetAllTasksUseCase getAllTasksUseCase;

  TasksCubit({required this.getAllTasksUseCase}):super(IntialStateOfTasksCubit());
  
  static TasksCubit get(context)=> BlocProvider.of(context);

  Future<void>getTasksFromCubit()async{
    List<MyTask> newTasks=[];
    List<MyTask> doneTasks=[];
    List<MyTask> archivedTasks=[];
    emit(GetTasksLoadingState());
    final Either<Failure,List<MyTask>> tasksOrFailure = await getAllTasksUseCase.excute();
    tasksOrFailure.fold(
      (fail) {
        emit(
          GetTasksFailedState(
            message: fail.message,
          ),
        );
      }, 
      (tasks) {
        
        tasks.forEach((element) {
          if(element.isDone=="yes")
          {
            doneTasks.add(element);
            if(element.isArc=="yes"){
              archivedTasks.add(element);
            }
          }else{
            newTasks.add(element);
            if(element.isArc=="yes"){
              archivedTasks.add(element);
            }
          }
        });
        emit(
          GetTasksSuccessState(
            newTasks:newTasks , doneTasks: doneTasks, archivedTasks: archivedTasks
            )
        );
      }
      );
     
  }

  





}