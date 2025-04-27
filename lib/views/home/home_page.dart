import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/model/task_model.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/view_models/home_provider.dart';
import 'package:untitled/views/home/add_task_page.dart';
import 'package:untitled/widget/task_card.dart';

import '../../view_models/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryClr,
        title: Center(child: Text("My Task", style: AppFont.appBarTxt)),
        actions: [
          GestureDetector(
            onTap: () {
              authProvider.logOut();
              Navigator.pushReplacementNamed(context, "/login");
            },
            child: Icon(Icons.logout, color: AppColor.white),
          ),
        ],
      ),
      body: StreamBuilder<List<TaskModel>>(
        stream: provider.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          final tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return const Center(child: Text('No tasks found.'));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(task: task);
            },
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
