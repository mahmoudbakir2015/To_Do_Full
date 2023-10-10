import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/tasks/presentation/controller/view_cubit/view_states.dart';

import '../../screens/3-new_tasks_screen/new_tasks_screen.dart';
import '../../screens/4-done_tasks_screen/done_tasks_screen.dart';
import '../../screens/5-archived_tasks_screen/archived_tasks_screen.dart';

class ViewCubit extends Cubit<ViewCubitStates> {
  static ViewCubit get(context) => BlocProvider.of(context);
  ViewCubit() : super(ViewCubitIntialState());

  TextEditingController contentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: "New",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.download_done_sharp),
      label: "Done",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.archive_outlined),
      label: "Archived",
    ),
  ];
  List<String> titelsOfAppBar = [
    "New tasks",
    "Done tasks",
    "Archived tasks",
  ];
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  void bottomItemTaped(int index) {
    this.currentIndex = index;
    emit(RefreshState());
  }

  void refreshWidgets() {
    emit(RefreshState());
  }
}
