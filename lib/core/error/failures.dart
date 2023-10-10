import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class EmptyTasksFailure extends Failure {
  const EmptyTasksFailure({required super.message});
}

class EmptyNewTasksFailure extends Failure {
  const EmptyNewTasksFailure({required super.message});
}

class EmptyDoneTasksFailure extends Failure {
  const EmptyDoneTasksFailure({required super.message});
}

class EmptyArchivedTasksFailure extends Failure {
  const EmptyArchivedTasksFailure({required super.message});
}

class UpdateTaskFailure extends Failure {
  const UpdateTaskFailure({required super.message});
}

class DeleteTaskFailure extends Failure {
  const DeleteTaskFailure({required super.message});
}

class AddTaskFailure extends Failure {
  const AddTaskFailure({required super.message});
}
