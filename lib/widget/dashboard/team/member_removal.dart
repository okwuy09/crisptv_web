import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/team/success_member_remove.dart';
import 'package:flutter/material.dart';

class RemoveTeamMemeber extends StatefulWidget {
  const RemoveTeamMemeber({super.key});

  @override
  State<RemoveTeamMemeber> createState() => _RemoveTeamMemeberState();
}

class _RemoveTeamMemeberState extends State<RemoveTeamMemeber> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenSize.height / 3.6,
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
                  'Are you sure you want to remove team member?',
                  style: style.copyWith(fontSize: 20),
                ),
                SizedBox(height: screenSize.height / 50),
                Divider(
                  color: AppColor.primaryColor.withOpacity(0.1),
                ),
                SizedBox(height: screenSize.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, false);
                        showDialog(
                          context: context,
                          builder: (_) => const SuccessfulRemoveTeamMemeber(),
                        );
                      },
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
