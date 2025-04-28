

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled/model/task_model.dart';
import 'package:untitled/services/firebase_task_Service.dart';

class HomeProvider extends ChangeNotifier {
  String? _email;
  String? get email => _email;
  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  final List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;
  bool _isLoading = false;

  final FirebaseTaskService _taskService = FirebaseTaskService();

  Future<void> fetchInitialTasks() async {
    _tasks.clear();
    _lastDocument = null;
    _hasMore = true;
    await fetchTasks();
  }

  Future<void> fetchTasks() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    String? mail = FirebaseAuth.instance.currentUser?.email;

    final result = await _taskService.getTask(
      mail.toString(),
      lastDocument: _lastDocument,
    );
    print("<<<<<<<<<<<<task list>>>>>>>>>>>>");
    print(result);
    print("<<<<<<<<<<<<task list>>>>>>>>>>>>");

    if (result.isNotEmpty) {
      _lastDocument = result.last.docSnapshot;
      _tasks.addAll(result.map((e) => e.taskModel));
    } else {
      _hasMore = false;
    }
    _isLoading = false;
    notifyListeners();
  }


  TaskModel taskModel = TaskModel();

  Future addTask() async {
    String? mail = FirebaseAuth.instance.currentUser?.email;

    List<String> updatedShareList = List<String>.from(
      taskModel.sharedWith ?? [],
    );
    updatedShareList.add(mail!);
    taskModel = TaskModel(
      title: taskModel.title,
      description: taskModel.description,
      createdAt: DateTime.now(),
      sharedWith: updatedShareList,
    );
    await FirebaseTaskService().addTask(taskModel);
    taskModel.sharedWith = [];
  }

  Future updateTask(TaskModel task) async {
    await FirebaseTaskService().updateTask(task);
  }

  Future deleteTask(String taskId) async {
    await FirebaseTaskService().deleteTask(taskId);
  }

  void shareTask(TaskModel task, BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        title: task.title,
        text: task.description,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  onRefresh() {
    notifyListeners();
  }
}

