import 'package:flutter/cupertino.dart';
import 'package:untitled/model/task_model.dart';
import 'package:untitled/services/firebase_task_Service.dart';

class HomeProvider extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  TaskModel taskModel = TaskModel();


  Stream<List<TaskModel>> getTasks() {
    return FirebaseTaskService().getTask();
  }

  Future addTask() async {
    taskModel = TaskModel(createdAt: DateTime.now());
    await FirebaseTaskService().addTask(taskModel);
    taskModel.sharedWith = [];
  }

  Future deleteTask(String taskId) async{
    await FirebaseTaskService().deleteTask(taskId);
  }

  onRefresh() {
    notifyListeners();
  }
}
