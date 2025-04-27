import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/model/task_model.dart';

const String TASK_COLLECTION_REF = "task";

class FirebaseTaskService {
  final CollectionReference _ref = FirebaseFirestore.instance.collection(
    TASK_COLLECTION_REF,
  );

  Stream<List<TaskModel>> getTask(String email) {
    return _ref
        .where('sharedWith', arrayContains: email)
        .snapshots()
        .map(
          (e) =>
              e.docs
                  .map(
                    (val) =>
                        TaskModel.fromMap(val.data() as Map<String, dynamic>),
                  )
                  .toList(),
        );
  }

  Future<void> addTask(TaskModel? task) async {
    String newId = _ref.doc().id;
    task?.id = newId;
    final data = task?.toMap();
    await _ref.doc(task?.id).set(data);
  }

  Future updateTask(TaskModel task) async{
    await _ref.doc(task.id).update(task.toMap());
  }

  Future deleteTask(String taskId) async {
    await _ref.doc(taskId).delete();
  }
}
