import 'package:crisptv/component/color.dart';
import 'package:flutter/material.dart';

final style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColor.primaryColor,
  fontFamily: 'SF Pro Display',
);

failedOperation({context, required String message}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 145,
          left: 25,
          right: 25,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.report_rounded,
              size: 20,
              color: AppColor.red,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                message,
                style: style.copyWith(
                  color: AppColor.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.lightRed,
        padding: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 5000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: AppColor.red)),
      ),
    );
