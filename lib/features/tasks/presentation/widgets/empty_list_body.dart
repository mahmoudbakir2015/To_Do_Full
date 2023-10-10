import 'package:flutter/cupertino.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

Widget emptyListBody({required String listName}){
  return Container(
    height: double.infinity,
    width: double.infinity,
    child: Center(
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 30,),
              Image(
                image: AssetImage(ImageAssets.emptyImage),
                height: 300,
                width: 700,
              ),
              SizedBox(height: 20,),
              Text(
                "There are no $listName tasks",
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