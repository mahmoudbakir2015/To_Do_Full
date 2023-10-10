import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';


showMyToast({required String message , bool isGreen=true}){

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor:isGreen?  Colors.green:Colors.red,
    textColor: ColorManager.white,
    fontSize: 16.0
  );

}
