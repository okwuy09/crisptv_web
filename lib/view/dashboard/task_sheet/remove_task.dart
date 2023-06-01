import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/task.dart';
import 'package:crisptv/service/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoveTasks extends StatelessWidget {
  final Tasks tasks;
  const RemoveTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<TaskController>(context);
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
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Are you sure you want to Delete this Task?',
                  style: style.copyWith(
                    fontSize: 20,
                    color: AppColor.white,
                  ),
                ),
                SizedBox(height: screenSize.height / 50),
                Divider(
                  color: AppColor.white.withOpacity(0.1),
                ),
                SizedBox(height: screenSize.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await provider.deleteTask(
                          docID: tasks.id,
                          context: context,
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
                            'Delete',
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
                            color: AppColor.white.withOpacity(0.5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: style.copyWith(
                              color: AppColor.white,
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
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Icon(
                  Icons.close,
                  color: AppColor.white,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
