import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

class SuccessfulRemoveTeamMemeber extends StatefulWidget {
  const SuccessfulRemoveTeamMemeber({super.key});

  @override
  State<SuccessfulRemoveTeamMemeber> createState() =>
      _SuccessfulRemoveTeamMemeberState();
}

class _SuccessfulRemoveTeamMemeberState
    extends State<SuccessfulRemoveTeamMemeber> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 7,
            width: screenSize.width,
            padding: EdgeInsets.all(screenSize.width / 50),
            decoration: BoxDecoration(
              color: AppColor.white,
              //borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: '“Uzoechi Adaugo Nkechi”',
                    style: style.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' has been removed from  the team',
                        style: style.copyWith(
                          fontSize: 24,
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
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'UNDO ACTION',
                        style: style.copyWith(
                          color: AppColor.white.withOpacity(0.8),
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
