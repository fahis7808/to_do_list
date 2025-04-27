import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/model/task_model.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/view_models/home_provider.dart';
import 'package:untitled/widget/custom_button.dart';
import 'package:untitled/widget/custom_text_field.dart';

import '../widget/sustom_snack_bar.dart';

class AddTaskPage extends StatelessWidget {
  final TaskModel? taskModel;

  const AddTaskPage({super.key, this.taskModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    return AlertDialog(
      scrollable: true,
      title: Text("Add New Task", style: AppFont.head),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomTextField(
              value: taskModel?.title.toString() ?? "",
              labelText: "New Task",
              onChanged: (val) {
                taskModel?.title = val;
                provider.taskModel.title = val;
              },
            ),
            SizedBox(height: 1.h),
            CustomTextField(
              value: taskModel?.description ?? "",
              labelText: "Description",
              minLines: 2,
              onChanged: (val) {
                taskModel?.description = val;
                provider.taskModel.description = val;
              },
            ),
            SizedBox(height: 1.h),
            Consumer<HomeProvider>(
              builder: (context, provider, _) {
                return Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        value: provider.email,
                        labelText: "Email who want to share",
                        onChanged: (val) {
                          provider.email = val;
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    CustomButton(
                      txt: "Add",
                      padding: EdgeInsets.symmetric(
                        vertical: 1.5.h,
                        horizontal: 4.w,
                      ),
                      onPressed: () async {
                        final email = provider.email?.trim();

                        if (email == null || email.isEmpty) {
                          return;
                        }
                        if (taskModel != null) {
                          taskModel!.sharedWith ??= [];
                          if (!taskModel!.sharedWith!.contains(email)) {
                            taskModel!.sharedWith!.add(email);
                          }
                        } else {
                          provider.taskModel.sharedWith ??= [];
                          if (!provider.taskModel.sharedWith!.contains(email)) {
                            provider.taskModel.sharedWith!.add(email);
                          }
                        }
                        provider.email = "";
                        provider.onRefresh();
                      },
                    ),
                  ],
                );
              },
            ),
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
                SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    txt: "Save",
                    onPressed: () {
                      if (taskModel!.id!.isNotEmpty) {
                        provider.updateTask(taskModel!);
                        Navigator.pop(context);
                      } else {
                        if (provider.taskModel.title != null) {
                          provider.addTask();
                          Navigator.pop(context);
                        } else {
                          final snackBar = CustomSnackBar.errorSnackBar(
                            "Task Can't be empty",
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
