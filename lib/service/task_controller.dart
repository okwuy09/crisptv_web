import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/task.dart';
import 'package:crisptv/view/dashboard/video/successful_publish.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class TaskController with ChangeNotifier {
  /// Fetch all users
  Stream<List<Tasks>> fetchAllTask() {
    var usersDoc = firebaseStore
        .collection('task')
        .orderBy('dateCreated', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Tasks.fromJson(doc.data())).toList());
    return usersDoc;
  }

  /// Delete Team Member
  Future deleteTask({
    required String docID,
    required BuildContext context,
  }) async {
    try {
      firebaseStore.collection('task').doc(docID).delete().then(
            (value) => Navigator.pop(context),
          );
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  /// Update Task status
  Future updateTaskStatus({
    required String status,
    required String docID,
  }) async {
    try {
      firebaseStore.collection('task').doc(docID).update({
        "status": status,
      });
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  /// Update task
  bool isUpdatingTask = false;
  Future updateTask({
    required BuildContext context,
    required String assignee,
    required DateTime dueDate,
    required String status,
    required String taskName,
    required String docID,
  }) async {
    try {
      isUpdatingTask = true;
      notifyListeners();
      firebaseStore.collection('task').doc(docID).update({
        "status": status,
        "assignee": assignee,
        "dueDate": dueDate.toIso8601String(),
        "taskName": taskName,
      }).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessUpload(
                title: 'Task has been successfully Updated',
                subTitle: '',
                category: taskName,
              ),
            ),
          });
      isUpdatingTask = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isUpdatingTask = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Add newsPost Cooment to the database
  bool isCreatingTask = false;
  Future creatTask({
    required BuildContext context,
    required String assignee,
    required DateTime dueDate,
    required String status,
    required String taskName,
  }) async {
    try {
      isCreatingTask = true;
      notifyListeners();

      final docComment = firebaseStore.collection('task').doc();
      final task = Tasks(
        id: docComment.id,
        assignee: assignee,
        dateCreated: DateTime.now(),
        dueDate: dueDate,
        status: status,
        taskName: taskName,
      );

      final json = task.toJson();
      docComment.set(json).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessUpload(
                title: 'Task has been successfully created',
                subTitle: '',
                category: taskName,
              ),
            ),
          });
      isCreatingTask = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isCreatingTask = false;
      notifyListeners();
      return e.toString();
    }
  }
}
