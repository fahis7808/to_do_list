import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/colors.dart';

class AppFont {
  static TextStyle head = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle errorTxt = TextStyle(fontSize: 15.sp, color: AppColor.error);

  static var textFieldLabel = TextStyle(
    fontSize: 15.sp,
    color: AppColor.white,
    fontWeight: FontWeight.bold,
  );
}
