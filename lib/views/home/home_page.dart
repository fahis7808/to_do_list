import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/view_models/home_provider.dart';
import 'package:untitled/views/home/add_task_page.dart';
import 'package:untitled/widget/task_card.dart';

import '../../view_models/auth_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.fetchInitialTasks();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        provider.fetchTasks();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
      body: provider.tasks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        controller: _scrollController,
        itemCount: provider.tasks.length,
        itemBuilder: (context, index) {
          final task = provider.tasks[index];
          return TaskCard(task: task);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryClr,
        child: Icon(Icons.add, color: AppColor.white, size: 30),
        onPressed: () {
          showDialog(context: context, builder: (context) => AddTaskPage());
        },
      ),
    );
  }
}


