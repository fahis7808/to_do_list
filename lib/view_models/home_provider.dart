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
