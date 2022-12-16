import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/custom_dropdown.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/task_sheet/create_task.dart';
import 'package:flutter/material.dart';

class TaskSheet extends StatefulWidget {
  const TaskSheet({Key? key}) : super(key: key);

  @override
  State<TaskSheet> createState() => _TaskSheetState();
}

class _TaskSheetState extends State<TaskSheet> {
  String selectedValue = 'ALL';
  List<String> dropDownItem = [
    'ALL',
    'INSIGHTS',
    'CONTO',
    'ROUNDTABLE',
    'MIND OVER MATTER',
    'INSPIRING STORIES',
    'PODCASTS',
    'BUSINESS DISCOVERY',
    'SHORT FILMS',
    'KNOW YOUR HEROES',
    'GAME CHANGERS',
    'POLITICS NOW',
    'TALK OR DRINK',
  ];

  List<String> status = [
    'Not Started Yet',
    'In Progress',
    'Completed',
    'Deadline Passed',
  ];
  String selectedStatus = 'Not Started Yet';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 80,
          width: screenSize.width,
          margin: const EdgeInsets.only(bottom: 0.3),
          padding: EdgeInsets.symmetric(horizontal: screenSize.width / 22),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FILTER BY:',
                style: style.copyWith(
                  fontSize: 14,
                  color: AppColor.white.withOpacity(0.6),
                ),
              ),
              const SizedBox(width: 20),
              CustomDropdown<String>(
                dropdownColor: AppColor.primaryColor,
                textColor: AppColor.white.withOpacity(0.6),
                padding: const EdgeInsets.only(bottom: 3),
                items: dropDownItem,
                onChanged: (val) => selectedValue = val,
                center: true,
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  // Navigator.pop(context, false);
                  showDialog(
                    context: context,
                    builder: (_) => const CreateTask(),
                  );
                },
                child: Container(
                  height: 33,
                  width: 130,
                  decoration: BoxDecoration(
                    color: AppColor.lightGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Create New Task',
                      style: style.copyWith(
                        fontSize: 13,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColor.primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width / 22,
            vertical: 25,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Task Name',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Status',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Assignee',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Due Date',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: AppColor.primaryColor,
            //padding: EdgeInsets.symmetric(horizontal: screenSize.width / 35),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: ((context, index) {
                return Container(
                  height: 56,
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 22),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.white.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'INSIGHT VIDEO SHOOTING',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: AppColor.white.withOpacity(0.4),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            value: selectedStatus,
                            onChanged: (newValue) {
                              setState(() {
                                selectedStatus = newValue!;
                              });
                            },
                            items: status.map((f) {
                              return DropdownMenuItem<String>(
                                value: f,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: f == 'Not Started Yet'
                                        ? AppColor.lightGray.withOpacity(0.3)
                                        : f == 'In Progress'
                                            ? AppColor.yellow.withOpacity(0.2)
                                            : f == 'Completed'
                                                ? AppColor.green
                                                    .withOpacity(0.2)
                                                : AppColor.red.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    f,
                                    style: style.copyWith(
                                      fontSize: 13,
                                      color: f == 'Not Started Yet'
                                          ? AppColor.white.withOpacity(0.8)
                                          : f == 'In Progress'
                                              ? AppColor.yellow
                                              : f == 'Completed'
                                                  ? AppColor.green
                                                  : AppColor.red,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: AppColor.white.withOpacity(0.4),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'KY Nwachukwu, Blessing C',
                          style: style.copyWith(
                            fontSize: 13,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: AppColor.white.withOpacity(0.4),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              '15th Aug, 2022',
                              style: style.copyWith(
                                fontSize: 12,
                                color: AppColor.white.withOpacity(0.6),
                              ),
                            ),
                            Expanded(flex: 2, child: Container()),
                            Container(
                              height: 56,
                              width: 1,
                              color: AppColor.white.withOpacity(0.4),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Edit',
                                  style: style.copyWith(
                                    fontSize: 14,
                                    color: AppColor.blue,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColor.red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: AppColor.red,
                                  size: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
