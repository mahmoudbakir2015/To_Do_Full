import 'package:flutter/material.dart';
import 'package:todo_application/features/tasks/presentation/screens/1-splash_screen/splash_screen.dart';
import 'package:todo_application/features/tasks/presentation/screens/2-layout_screen/layout_screen.dart';

import '../screens/6-add_task_screen/add_task_screen.dart';

class RoutesNames {
  static const String splashRoute =
      "splash"; //hena hayfhm 2n de awl 7aga l aap hayft7 3leha mn 8er ma aaolo
  static const String layoutRouteRoute = "layout";
  static const String detailsRoute = "details";
  static const String addTaskRoute = "addTask";
  // static const String storeDetailsRoute="/storeDetails";
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesNames.layoutRouteRoute:
        return MaterialPageRoute(builder: (_) => LayoutScreen());
      case RoutesNames.addTaskRoute:
        return MaterialPageRoute(builder: (_) => AddTaskScreen());
    }
    return null;
  }
}
