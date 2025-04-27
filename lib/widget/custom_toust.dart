import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/colors.dart';

class CustomToast {
  errorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 15.sp,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.white,
      textColor: AppColor.error,
    );
  }
  successToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 15.sp,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.primaryClr,
      textColor: AppColor.white,
    );
  }
}
