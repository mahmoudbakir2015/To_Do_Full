import 'package:flutter/cupertino.dart';
import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';

import '../resources/assets_manager.dart';

Widget noTasksAtDataBase(){
  return Container(
    height: double.infinity,
    width: double.infinity,
    child: Center(
      child: SingleChildScrollView(
        child: Column(
            children: [
              Image(
                image: AssetImage(ImageAssets.notFoundImage),
                height: 300,
                width: 700,
              ),
              SizedBox(height: 20,),
              Text(
                "Add your first task",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorManager.grey,
                ),
              ),
            ],
          ),
      ),
    ),
  );
}