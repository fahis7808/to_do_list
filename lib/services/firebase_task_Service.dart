
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/model/task_model.dart';

const String TASK_COLLECTION_REF = "task";
class FirebaseTaskService {
  final CollectionReference _ref = FirebaseFirestore.instance.collection(
    TASK_COLLECTION_REF,
  );

  Future<List<_TaskWithSnapshot>> getTask(
      String email, {
        DocumentSnapshot? lastDocument,
        int limit = 5,
      }) async {
    Query query = _ref
        .where('sharedWith', arrayContains: email)
        .orderBy('createdAt')
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return _TaskWithSnapshot(
        taskModel: TaskModel.fromMap(data),
        docSnapshot: doc,
      );
    }).toList();
  }



  Future<void> addTask(TaskModel? task) async {
    String newId = _ref.doc().id;
    task?.id = newId;
    final data = task?.toMap();
    await _ref.doc(task?.id).set(data);
  }

  Future updateTask(TaskModel task) async {
    await _ref.doc(task.id).update(task.toMap());
  }

  Future deleteTask(String taskId) async {
    await _ref.doc(taskId).delete();
  }
}
class _TaskWithSnapshot {
  final TaskModel taskModel;
  final DocumentSnapshot docSnapshot;

  _TaskWithSnapshot({required this.taskModel, required this.docSnapshot});
}