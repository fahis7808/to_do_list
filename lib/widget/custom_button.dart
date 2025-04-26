import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String txt;

  const CustomButton({super.key, this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
        decoration: BoxDecoration(
          color: AppColor.primaryClr,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Text(
          txt.toString(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
