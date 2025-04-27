import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/model/task_model.dart';

import '../utlities/app_font.dart';
import '../utlities/colors.dart';
import '../view_models/home_provider.dart';
import '../views/home/add_task_page.dart';
import 'custom_success_alert.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title.toString(), style: AppFont.title),
                      Text(
                        task.description.toString(),
                        style: AppFont.subTitle,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddTaskPage(taskModel: task),
                    );
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (ctx) => CustomSuccessAlert(
                            txt: "Are you sure you want delete this task?",
                            onTap: () {
                              provider.deleteTask(task.id.toString());
                              Navigator.pop(context);
                            },
                          ),
                    );
                  },
                  icon: Icon(CupertinoIcons.delete, color: AppColor.error),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.sharedWith!.join(", "),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColor.primaryDrkClr,
                    ),
                  ),
                ),
                  IconButton(
                  onPressed: () {
                    provider.shareTask(task, context);
                  },
                  icon: Icon(Icons.share, color: AppColor.bgClr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
