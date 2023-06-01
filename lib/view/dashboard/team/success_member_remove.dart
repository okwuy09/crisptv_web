import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:flutter/material.dart';

class SuccessfulRemoveTeamMemeber extends StatelessWidget {
  final String name;
  const SuccessfulRemoveTeamMemeber({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 10,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: AppColor.gray,
              //borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '“$name”',
                    style: style.copyWith(
                      fontSize: 18,
                      color: AppColor.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  has been removed from  the team',
                        style: style.copyWith(
                          fontSize: 16,
                          color: AppColor.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () => Navigator.pop(context, false),
                  child: Container(
                    height: 37,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'BACK',
                        style: style.copyWith(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
