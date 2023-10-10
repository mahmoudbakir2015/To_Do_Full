import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/tasks/presentation/controller/edit_cubit/edit_states.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/use_cases/add_task_usecase.dart';
import '../../../domain/use_cases/delete_task_use_case.dart';
import '../../../domain/use_cases/updateTaskUsecase.dart';

class EditCubit extends Cubit<EditCubitStates>{
  UpdateTaskUseCase updateTaskUseCase;
  DeleteTaskUseCase deleteTaskUseCase;
  AddTaskUseCase addTaskUseCase;

  static EditCubit get(context)=> BlocProvider.of(context);


  EditCubit({
    required this.updateTaskUseCase ,
    required this. addTaskUseCase,
    required this. deleteTaskUseCase,
    }):super(EditIntialState());


  Future<void> updateTaskFromCubit({required MyTask task , required String attribute , required String value , bool callFromDone=true})async{
    emit(UpdateTaskLoadingState());
    final Either<Failure,Unit> updateOrFailure = await updateTaskUseCase.excute(task: task,attribute: attribute,value: value);
    updateOrFailure.fold(
      (fail) {
        emit(
          UpdateTaskFailedState(message: fail.message)
        );
      } , 
      (update) {
        emit(UpdateTaskSuccessState(
          movedTo: callFromDone?"done":"archived",
        ));
      }
      );
  }

  Future<void> moveTaskToDoneFromCubit({required MyTask task})async{
    task.isDone="yes";
    await updateTaskFromCubit(task: task , attribute: "isDone" , value: "yes");
    
  }
  
  Future<void> moveTaskToArchivedFromCubit({required MyTask task})async{
    task.isArc="yes";
    await updateTaskFromCubit(task: task,attribute: "isArc" , value: "yes",callFromDone: false);
    
  }

  Future<void> addTaskFromCubit ({required MyTask task})async{

    emit(UpdateTaskLoadingState());
     final Either<Failure,Unit> addOrFailure = await addTaskUseCase.excute(task);
     addOrFailure.fold(
      (fail) {
        emit(UpdateTaskFailedState(message: fail.message));
      } , 
      (addedSuc) {
        emit(AddTaskSuccessState());
      }
      );
  }

  Future<void>deleteTask (int id)async{
    emit(DeleteTaskLoadingState());
    Either<Failure, Unit> deleteOrFailure =await deleteTaskUseCase.excute(id);
    deleteOrFailure.fold(
      (fail) {
        emit(DeleteTaskFailedState(message: fail.message));
      }, 
      (succes) {
        emit(DeleteTaskSuccessState());
      },
      );
  }

}
