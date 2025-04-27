import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/task_model.dart';
import 'package:untitled/services/firebase_task_Service.dart';

class HomeProvider extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  Stream<List<TaskModel>> getTasks() {
    String? mail = FirebaseAuth.instance.currentUser?.email;
    return FirebaseTaskService().getTask(mail.toString());
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

  Future updateTask(TaskModel task) async{
    await FirebaseTaskService().updateTask(task);
  }

  Future deleteTask(String taskId) async {
    await FirebaseTaskService().deleteTask(taskId);
  }

  onRefresh() {
    notifyListeners();
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
