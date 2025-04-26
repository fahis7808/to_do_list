import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/widget/custom_button.dart';
import 'package:untitled/widget/custom_text_field.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text("Add New Task", style: AppFont.head),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomTextField(value: "", labelText: "New Task"),
            SizedBox(height: 1.h),
            CustomTextField(value: "", labelText: "Description", minLines: 2),
            SizedBox(height: 1.h),
            CustomTextField(value: "", labelText: "Email who want to share"),
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    txt: "Cancel",
                    btnClr: AppColor.white,
                    txtClr: AppColor.primaryClr,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 1.2.w),

                Expanded(child: CustomButton(txt: "Save")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
