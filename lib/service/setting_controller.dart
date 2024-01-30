import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/ads.dart';
import 'package:crisptv/model/slide.dart';
import 'package:flutter/material.dart';

class SettingController with ChangeNotifier {
  /// Upload ads1
  bool ispostingAds = false;
  Future uploadAds1(
      {required BuildContext context,
      required Uint8List imageURL,
      required String imageName,
      required String type}) async {
    try {
      ispostingAds = true;
      notifyListeners();
      final docAds = firebaseStore.collection('ads').doc('ads1');
      var snapshot = await firebaseStorage
          .ref()
          .child('images/$imageName')
          .putData(imageURL);

      var imageUrl = await snapshot.ref.getDownloadURL();

      final ads = Ads(id: docAds.id, imageURL: imageUrl, type: type);

      final json = ads.toJson();
      docAds.set(json).then((value) => Navigator.pop(context));
      ispostingAds = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      ispostingAds = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Fetch ads1
  Future<Ads> fetchAd1() async {
    var adDoc = await firebaseStore.collection('ads').doc('ads1').get();
    return Ads.fromJson(adDoc.data()!);
  }

  /// upload ads2
  Future uploadAds2(
      {required BuildContext context,
      required Uint8List imageURL,
      required String imageName,
      required String type}) async {
    try {
      ispostingAds = true;
      notifyListeners();
      final docAd = firebaseStore.collection('ads').doc('ads2');
      var snapshot = await firebaseStorage
          .ref()
          .child('images/$imageName')
          .putData(imageURL);

      var imageUrl = await snapshot.ref.getDownloadURL();

      final ads = Ads(id: docAd.id, imageURL: imageUrl, type: type);

      final json = ads.toJson();
      docAd.set(json).then((value) => Navigator.pop(context));
      ispostingAds = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      ispostingAds = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Fetch ads2
  Future<Ads> fetchAd2() async {
    var adDoc = await firebaseStore.collection('ads').doc('ads2').get();
    return Ads.fromJson(adDoc.data()!);
  }

  /// Slide
  Future uploadSlide(
      {required BuildContext context,
      required Uint8List imageURL,
      required String imageName}) async {
    try {
      ispostingAds = true;
      notifyListeners();
      final docAds = firebaseStore.collection('ads').doc('slide');
      var snapshot = await firebaseStorage
          .ref()
          .child('images/$imageName')
          .putData(imageURL);

      var imageUrl = await snapshot.ref.getDownloadURL();

      final ads = Slide(
        id: docAds.id,
        imageURL: [imageUrl],
      );
      final json = ads.toJson();
      docAds.set(json).then((value) => Navigator.pop(context));
      ispostingAds = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      ispostingAds = false;
      notifyListeners();
      return e.toString();
    }
  }

  /// Fetch Slide
  Future<Slide> fetchSlide() async {
    var adDoc = await firebaseStore.collection('ads').doc('slide').get();
    return Slide.fromJson(adDoc.data()!);
  }
}
