import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/view/dashboard/video/success_create.dart';
import 'package:flutter/material.dart';

class CategoryController with ChangeNotifier {
  ///
  Future<void> deleteVideoCategory(String id) {
    return firebaseStore.collection('video_category').doc(id).delete();
  }

  Future<void> deleteNewsCategory(String id) {
    return firebaseStore.collection('news_category').doc(id).delete();
  }

  Future<void> deleteTeamCategory(String id) async {
    return firebaseStore.collection('team_category').doc(id).delete();
  }

  /// Fetch all News Category
  Stream<List<Category>> fetchAllTeamCategory() {
    var categorysDoc = firebaseStore
        .collection('team_category')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());
    return categorysDoc;
  }

  /// Add new News Category to the database
  bool isCreatingTeamCategory = false;
  Future addTeamCategory({
    required BuildContext context,
    required String name,
  }) async {
    try {
      isCreatingTeamCategory = true;
      notifyListeners();
      final docCategory = firebaseStore.collection('team_category').doc();
      final post = Category(
        id: docCategory.id,
        name: name,
        type: 'team',
      );
      final json = post.toJson();
      docCategory.set(json).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessCreate(
                title: name,
                category: ' Category has been created successfully',
              ),
            ),
          });
      isCreatingTeamCategory = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isCreatingTeamCategory = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Fetch all News Category
  Stream<List<Category>> fetchAllNewsCategory() {
    var categorysDoc = firebaseStore
        .collection('news_category')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());
    return categorysDoc;
  }

  /// Add new News Category to the database
  bool isCreatingNewsCategory = false;
  Future addNewsCategory({
    required BuildContext context,
    required String name,
  }) async {
    try {
      isCreatingNewsCategory = true;
      notifyListeners();
      final docCategory = firebaseStore.collection('news_category').doc();
      final post = Category(
        id: docCategory.id,
        name: name,
        type: 'news',
      );
      final json = post.toJson();
      docCategory.set(json).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessCreate(
                title: name,
                category: ' Category has been created successfully',
              ),
            ),
          });
      isCreatingNewsCategory = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isCreatingNewsCategory = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Fetch all Video Category
  Stream<List<Category>> fetchAllVideoCategory() {
    var categorysDoc = firebaseStore
        .collection('video_category')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());

    return categorysDoc;
  }

  /// Add new Video Category to the database
  bool isCreatingVideoCategory = false;
  Future addVideoCategory({
    required BuildContext context,
    required String name,
  }) async {
    try {
      isCreatingVideoCategory = true;
      notifyListeners();
      final docCategory = firebaseStore.collection('video_category').doc();
      final post = Category(
        id: docCategory.id,
        name: name,
        type: 'video',
      );
      final json = post.toJson();
      docCategory.set(json).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessCreate(
                title: name,
                category: ' Category has been created successfully',
              ),
            ),
          });
      isCreatingVideoCategory = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isCreatingVideoCategory = false;
      notifyListeners();
      return e.toString();
    }
  }
}
