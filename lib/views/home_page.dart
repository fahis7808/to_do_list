import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/views/add_task_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryClr,
        title: Center(child: Text("My Task", style: AppFont.appBarTxt)),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("To Do Something", style: AppFont.title),
                  Text("description", style: AppFont.subTitle),
                  Text(
                    "fahisup@gmail.com",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColor.primaryDrkClr,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryClr,
        child: Icon(Icons.add, color: AppColor.white, size: 30, weight: 30),
        onPressed: () {
          showDialog(context: context, builder: (context) => AddTaskPage());
        },
      ),
    );
  }
}
