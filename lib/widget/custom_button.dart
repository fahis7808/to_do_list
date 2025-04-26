import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String txt;
  final Color? btnClr;
  final Color? txtClr;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.txt,
    this.btnClr,
    this.txtClr,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
          color: btnClr ?? AppColor.primaryClr,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Center(
          child: Text(
            txt.toString(),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: txtClr ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
