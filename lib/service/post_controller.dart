import 'dart:typed_data';

import 'package:crisptv_media/component/getyoutubeid.dart';
import 'package:crisptv_media/constant.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/comment.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/view/dashboard/video/successful_publish.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PostController with ChangeNotifier {
  PostController() {
    fetchAllPost('news');
  }

  /// Add newsPost Cooment to the database
  bool isSubscribing = false;
  Future subscribe({
    required String email,
  }) async {
    try {
      isSubscribing = true;
      notifyListeners();
      final docComment = firebaseStore.collection('subscribe').doc();

      docComment.set({"email": email}).then((value) => {
            isSubscribing = false,
            notifyListeners(),
          });
    } on FirebaseException catch (e) {
      ispostingComment = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Fetch all videoPost
  Stream<List<Posts>> fetchAllPost(String postType) {
    var postsDoc = firebaseStore
        .collection('post')
        .limit(20)
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Posts.fromJson(doc.data())).toList());
    return postsDoc;
  }

  /// Fetch all News Post comment
  Stream<List<Comments>> fetchPostComment(String postID) {
    var commentsDoc = firebaseStore
        .collection('post')
        .doc(postID)
        .collection('comment')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Comments.fromJson(doc.data())).toList());
    return commentsDoc;
  }

  /// Add newsPost Cooment to the database
  bool ispostingComment = false;
  Future postComment({
    required BuildContext context,
    required String userName,
    required String userImage,
    required String writeUp,
    required String postID,
  }) async {
    try {
      ispostingComment = true;
      notifyListeners();

      final docComment = firebaseStore
          .collection('post')
          .doc(postID)
          .collection('comment')
          .doc();
      final post = Comments(
        id: docComment.id,
        time: DateTime.now(),
        writeUp: writeUp,
        userImage: userImage,
        userName: userName,
        likes: [],
      );

      final json = post.toJson();
      docComment.set(json);
      ispostingComment = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      ispostingComment = false;
      notifyListeners();
      return e.toString();
    }
  }

  // Delete Post
  Future deletePost(String postId, BuildContext context) async {
    await firebaseStore.collection('post').doc(postId).delete().then(
          (value) => Navigator.pop(context),
        );
    notifyListeners();
  }

  /// Add new Post to the database
  bool isposting = false;
  Future posts({
    required BuildContext context,
    required String posterName,
    required Uint8List imageFile,
    required String imageName,
    required Category category,
    required String title,
    required String writeUp,
    required String videoUrl,
    required bool allowComment,
    required String postType,
  }) async {
    try {
      isposting = true;
      notifyListeners();
      final docPost = firebaseStore.collection('post').doc();
      if (postType == 'news') {
        var snapshot = await firebaseStorage
            .ref()
            .child('images/$imageName')
            .putData(imageFile);

        var imageUrl = await snapshot.ref.getDownloadURL();

        final post = Posts(
          id: docPost.id,
          categoryID: category.id,
          image: imageUrl,
          posterName: posterName,
          time: DateTime.now(),
          title: title,
          writeUp: writeUp,
          videoUrl: '',
          likes: [],
          allowComment: allowComment,
          postType: postType,
        );

        final json = post.toJson();
        docPost.set(json).then((value) {
          Navigator.pop(context, false);
          showDialog(
            context: context,
            builder: (_) => SuccessUpload(
              title: 'Your Post has been published successfully',
              subTitle: 'The Post was published under',
              category: category.name,
            ),
          );
        });
        isposting = false;
        notifyListeners();
      } else {
        /// Youtube thumnail
        var image = getYoutubeThumbnail(videoUrl);
        final post = Posts(
          id: docPost.id,
          categoryID: category.id,
          image: image,
          posterName: posterName,
          time: DateTime.now(),
          title: title,
          videoUrl: videoUrl,
          likes: [],
          allowComment: true,
          postType: postType,
          writeUp: '',
        );

        final json = post.toJson();
        docPost.set(json).then((value) {
          Navigator.pop(context, false);
          showDialog(
            context: context,
            builder: (_) => SuccessUpload(
              title: 'Your video has been published successfully',
              subTitle: 'The video was published under',
              category: category.name,
            ),
          );
        });
        isposting = false;
        notifyListeners();
      }
    } on FirebaseException catch (e) {
      isposting = false;
      notifyListeners();
      return e.toString();
    }
  }
}
