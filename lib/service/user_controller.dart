import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/team.dart';
import 'package:crisptv/model/users.dart';
import 'package:crisptv/view/dashboard/video/successful_publish.dart';
import 'package:flutter/material.dart';

import '../view/dashboard/team/success_member_remove.dart';

class UserController with ChangeNotifier {
  // UserController() {
  //   fetchUserProfile();
  // }
  Users userData = Users();

  /// Fetch all users
  Stream<List<Users>> fetchAllUser() {
    var usersDoc = firebaseStore
        .collection('users')
        .orderBy('date_created', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Users.fromJson(doc.data())).toList());
    notifyListeners();
    return usersDoc;
  }

  /// fetch user current profile
  Future<Users> fetchUserProfile() async {
    var userDoc = await firebaseStore.collection('users').doc(user.uid).get();
    firebaseStore
        .collection('users')
        .doc(user.uid)
        .snapshots()
        .listen((event) => {
              userData = Users.fromJson(event.data()!),
              //notifyListeners(),
            });
    return Users.fromJson(userDoc.data()!);
  }

  /// fetch team Memeber
  Future<TeamMember> fetchTeamMember(String userID) async {
    var teamDoc =
        await firebaseStore.collection('team_member').doc(user.uid).get();
    firebaseStore.collection('team_member').doc(userID).snapshots().listen(
          (event) => TeamMember.fromJson(event.data()!),
        );
    return TeamMember.fromJson(teamDoc.data()!);
  }

  /// fetch all team Memebers
  Stream<List<TeamMember>> fetchAllTeamMember() {
    var teamDoc = firebaseStore
        .collection('team_member')
        .orderBy('timeCreated', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TeamMember.fromJson(doc.data()))
            .toList());
    return teamDoc;
  }

  /// Delete Team Member
  Future deleteTeamMember({
    required BuildContext context,
    required String userName,
    required String docID,
  }) async {
    try {
      firebaseStore
          .collection('team_member')
          .doc(docID)
          .delete()
          .then((value) => {
                Navigator.pop(context, false),
                notifyListeners(),
                showDialog(
                  context: context,
                  builder: (_) => SuccessfulRemoveTeamMemeber(name: userName),
                ),
              });
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  /// Update Team Member
  bool isUpdatingMember = false;
  Future updateTeamMember({
    required BuildContext context,
    required String userName,
    required String position,
    required String positionID,
    required String docID,
  }) async {
    try {
      isUpdatingMember = true;
      notifyListeners();

      firebaseStore.collection('team_member').doc(docID).update({
        "userName": userName,
        "position": position,
        "positionID": positionID,
      }).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessUpload(
                title: 'Team member details updated successfully!',
                subTitle: '',
                category: position,
              ),
            ),
          });
      isUpdatingMember = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isUpdatingMember = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Add Team Member to the database
  bool isCreatingMember = false;
  createTeamMember({
    required BuildContext context,
    required String userName,
    required String userID,
    required String imageName,
    required String userImage,
    required String position,
    required String positionID,
  }) {
    try {
      isCreatingMember = true;
      notifyListeners();

      final docComment = firebaseStore.collection('team_member').doc();
      final post = TeamMember(
        id: docComment.id,
        userID: userID,
        timeCreated: DateTime.now(),
        imageUrl: userImage,
        userName: userName,
        position: position,
        positionID: positionID,
        ongoingTaskNo: '',
        scheduleNo: '',
      );

      final json = post.toJson();
      docComment.set(json).then((value) => {
            Navigator.pop(context, false),
            showDialog(
              context: context,
              builder: (_) => SuccessUpload(
                title: 'Team member added successfully!',
                subTitle: '',
                category: position,
              ),
            ),
          });

      isCreatingMember = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      isCreatingMember = false;
      notifyListeners();
      return failedOperation(
        message: e.toString(),
        context: context,
      );
    }
  }
}
