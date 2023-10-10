abstract class EditCubitStates {}

class EditIntialState extends EditCubitStates{}

class UpdateTaskSuccessState extends EditCubitStates{
  String movedTo;
  UpdateTaskSuccessState({required this.movedTo});
}
class UpdateTaskFailedState extends EditCubitStates{
  String message ;
  UpdateTaskFailedState({required this.message});
}
class UpdateTaskLoadingState extends EditCubitStates{}



class DeleteTaskSuccessState extends EditCubitStates{}
class DeleteTaskFailedState extends EditCubitStates{
  String message ;
  DeleteTaskFailedState({required this.message});
}
class DeleteTaskLoadingState extends EditCubitStates{}


class AddTaskSuccessState extends EditCubitStates{}
class AddTaskFailedState extends EditCubitStates{
  String message ;
  AddTaskFailedState({required this.message});
}
class AddTaskLoadingState extends EditCubitStates{}