import 'dart:typed_data';

import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/users.dart';
import 'package:crisptv/service/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthenticationController with ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  // signIn function with firebase
  bool isSignIn = false;
  Future<String?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isSignIn = true;
      notifyListeners();
      await _firebaseAuth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
        (value) {
          if (value.user != null) {
            context.go('/dashboard');
          }
        },
      );
      isSignIn = false;
      notifyListeners();

      return 'Success';
    } on FirebaseAuthException catch (e) {
      isSignIn = false;
      notifyListeners();
      // ignore: use_build_context_synchronously
      return failedOperation(
        message: e.toString(),
        context: context,
      );
    }
  }

// signUp function with firebase
  bool isSignUp = false;
  Future signUp({
    required String email,
    required String password,
    required String fullName,
    required Uint8List userImage,
    required BuildContext context,
    required String imageName,
    required String position,
    required String positionID,
  }) async {
    try {
      isSignUp = true;
      notifyListeners();
      var userdata = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .then(
        (value) async {
          if (value.user != null) {
            var snapshot = await firebaseStorage
                .ref()
                .child('images/$imageName')
                .putData(userImage);

            var imageUrl = await snapshot.ref.getDownloadURL();

            /// create profile on signup using Email and password
            final docUser =
                firebaseStore.collection('users').doc(value.user!.uid);
            final user = Users(
              avatar: imageUrl,
              email: email.trim(),
              fullName: fullName.trim(),
              id: docUser.id,
              banned: false,
              dateCreated: DateTime.now(),
              role: 'user',
            );
            final json = user.toJson();
            //create document and write data to firebase
            docUser.set(json).then(
                  (value) => {
                    Provider.of<UserController>(context, listen: false)
                        .createTeamMember(
                      context: context,
                      userName: fullName.trim(),
                      userID: docUser.id,
                      imageName: imageName,
                      userImage: imageUrl,
                      position: position,
                      positionID: positionID,
                    ),
                  },
                );
          }
        },
      );

      isSignUp = false;
      notifyListeners();
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(userdata.credential!);
    } on FirebaseAuthException catch (e) {
      isSignUp = false;
      notifyListeners();
      // ignore: use_build_context_synchronously
      return failedOperation(
        message: e.toString(),
        context: context,
      );
    }
  }

  // signOut fuction with firebase
  Future<void> signOut({required BuildContext context}) async {
    await _firebaseAuth.signOut().then((value) => context.go('/admin'));
  }
}
