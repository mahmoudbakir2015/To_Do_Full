import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_application/features/tasks/presentation/resources/assets_manager.dart';
import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';
import 'package:todo_application/features/tasks/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesNames.layoutRouteRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Image(
            image: AssetImage("${ImageAssets.splashImage}"),
          ),
        ),
      ),
    );
  }
}
