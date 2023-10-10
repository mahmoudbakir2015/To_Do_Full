import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

Widget defultFormField({
  Future<VoidCallback?> onChanged(String? value)?,
  VoidCallback? onSubmitted(String value)?,
  required String? validate(String? value)?,
  VoidCallback? ontap,
  required String? labeltext,
  required Icon? prefix,
  IconButton? suffix,
  TextInputType? textInputType = TextInputType.emailAddress,
  bool isobs = false,
  VoidCallback? suffixFuction,
  TextEditingController? controller,
  bool isClickable = true,
}) {
  return TextFormField(
    enabled: isClickable,
    cursorColor: ColorManager.primary,
    controller: controller,
    onTap: ontap,
    validator: validate,
    onChanged: onChanged,
    onFieldSubmitted: onSubmitted,
    obscureText: isobs ? true : false,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorManager.primary,
          )),
      labelText: '${labeltext}',
      labelStyle: TextStyle(color: ColorManager.primary),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorManager.primary,
          )),
      prefixIcon: prefix,
      suffixIcon: suffix,
    ),
    keyboardType: textInputType,
  );
}
