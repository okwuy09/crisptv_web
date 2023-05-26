import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

class SuccessCreate extends StatefulWidget {
  final String title;
  final String category;
  const SuccessCreate({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<SuccessCreate> createState() => _SuccessCreateState();
}

class _SuccessCreateState extends State<SuccessCreate> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 1.5,
            width: screenSize.width,
            padding: EdgeInsets.all(screenSize.width / 40),
            margin: EdgeInsets.symmetric(
              horizontal: screenSize.width < 800
                  ? screenSize.width / 15
                  : screenSize.width / 3,
              vertical: screenSize.height / 8,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 138,
                      width: 138,
                      decoration: BoxDecoration(
                        color: const Color(0xffE9F5EC),
                        borderRadius: BorderRadius.circular(111),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 26,
                      child: Container(
                        height: 87,
                        width: 87,
                        decoration: BoxDecoration(
                          color: const Color(0xff1B983B),
                          borderRadius: BorderRadius.circular(111),
                        ),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: AppColor.white,
                          size: 50,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: widget.title,
                      style: style.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: widget.category,
                          style: style.copyWith(
                            color: AppColor.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height / 20,
            right: screenSize.width / 3,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 37,
                width: 69,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'CLOSE',
                    style: style.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
