import 'package:flutter/material.dart';
import 'package:untitled/utlities/colors.dart';

import '../utlities/app_font.dart';

class CustomSnackBar {
  static SnackBar successesSnackBar(String message) {
    return SnackBar(
      content: Center(child: Text(message,style: AppFont.textFieldLabel,)),
      backgroundColor: AppColor.primaryClr,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
  static SnackBar errorSnackBar(String message) {
    return SnackBar(
      content: Center(child: Text(message,style: AppFont.errorTxt,)),
      backgroundColor: AppColor.white,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

