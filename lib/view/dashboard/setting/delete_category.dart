import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/category.dart';
import 'package:flutter/material.dart';

class DeleteCategory extends StatelessWidget {
  final Category category;
  final void Function()? onTap;
  const DeleteCategory(
      {super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 3.32,
            width: screenSize.width,
            padding: EdgeInsets.all(screenSize.width / 40),
            margin: EdgeInsets.only(
              top: screenSize.height / 2,
              right: screenSize.width / 4.5,
              left: screenSize.width / 2.5,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Are you sure you want to delete ${category.name} Category?',
                  style: style.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Divider(
                  color: AppColor.primaryColor.withOpacity(0.1),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Yes I\'m 100% Sure',
                            style: style.copyWith(
                              color: AppColor.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 10),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColor.primaryColor.withOpacity(0.5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'No! Not yet',
                            style: style.copyWith(
                              color: AppColor.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height / 2,
            right: screenSize.width / 5.5,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Icon(
                  Icons.close,
                  color: AppColor.primaryColor,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
