import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/colors.dart';

class AppFont {
  static TextStyle head = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );


  static TextStyle subTitle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle title = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle errorTxt = TextStyle(fontSize: 15.sp, color: AppColor.error);

  static var textFieldLabel = TextStyle(
    fontSize: 15.sp,
    color: AppColor.white,
    fontWeight: FontWeight.bold,
  );
  static var appBarTxt = TextStyle(
    fontSize: 18.sp,
    color: AppColor.white,
    fontWeight: FontWeight.bold,
  );

}
