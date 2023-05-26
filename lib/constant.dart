import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'component/color.dart';

final firebaseStorage = FirebaseStorage.instance;
final firebaseStore = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

String capitalizeAfterDot(String text) {
  final split = text.replaceAll(RegExp(r'\.\s+'), ' #').split(' ');
  String result = split.reduce((a, b) {
    if (b.startsWith('#')) {
      return a + b.replaceRange(0, 2, '. ${b[1].toUpperCase()}');
    }
    return '$a $b';
  });

  return result.replaceRange(0, 1, result[0].toUpperCase());
}

final buttonCircularIndicator = Center(
  child: SizedBox(
    height: 25,
    width: 25,
    child: CircularProgressIndicator(color: AppColor.white),
  ),
);
