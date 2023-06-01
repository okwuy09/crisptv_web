import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/task.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/task_controller.dart';
import 'package:crisptv/view/dashboard/task_sheet/create_task.dart';
import 'package:crisptv/view/dashboard/task_sheet/remove_task.dart';
import 'package:crisptv/view/dashboard/task_sheet/update_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTask extends StatefulWidget {
  const UserTask({Key? key}) : super(key: key);

  @override
  State<UserTask> createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  Category? _selectedValue;
  late Stream<List<Category>> _category; //= 'Choose from the dropdown';

  @override
  void initState() {
    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllVideoCategory();
    super.initState();
  }

  List<String> status = [
    'Not Started',
    'In Progress',
    'Completed',
    'Deadline Passed',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<TaskController>(context);
    return Column(
      children: [
        Divider(
          height: 0.5,
          color: AppColor.white.withOpacity(0.4),
        ),
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
              // Text(
              //   'FILTER BY:',
              //   style: style.copyWith(
              //     fontSize: 14,
              //     color: AppColor.white.withOpacity(0.6),
              //   ),
              // ),
              // const SizedBox(width: 20),
              // StreamBuilder<List<Category>>(
              //   stream: _category,
              //   builder: (context, snapshot) {
              //     if (!snapshot.hasData) {
              //       return buttonCircularIndicator;
              //     } else {
              //       var categories = snapshot.data!;
              //       return Container(
              //         height: 33,
              //         padding: const EdgeInsets.only(
              //           left: 10.0,
              //           right: 10.0,
              //         ),
              //         decoration: ShapeDecoration(
              //           shape: RoundedRectangleBorder(
              //             side: BorderSide(
              //                 width: 0.8,
              //                 style: BorderStyle.solid,
              //                 color: AppColor.white.withOpacity(0.6)),
              //             borderRadius:
              //                 const BorderRadius.all(Radius.circular(5.0)),
              //           ),
              //         ),
              //         child: Theme(
              //           data: Theme.of(context).copyWith(
              //               focusColor: AppColor.lightGray.withOpacity(0.5)),
              //           child: categories.isEmpty
              //               ? Center(
              //                   child: Text(
              //                     'No category created',
              //                     style: style.copyWith(
              //                         color: AppColor.white.withOpacity(0.8)),
              //                   ),
              //                 )
              //               : DropdownButtonHideUnderline(
              //                   child: DropdownButton<Category>(
              //                     dropdownColor: AppColor.primaryColor,
              //                     borderRadius: BorderRadius.circular(8),
              //                     value: _selectedValue ?? categories[0],
              //                     onChanged: (newValue) {
              //                       setState(() {
              //                         _selectedValue = newValue;
              //                       });
              //                     },
              //                     items: categories.map((Category f) {
              //                       return DropdownMenuItem<Category>(
              //                         value: f,
              //                         child: Text(
              //                           f.name.toUpperCase(),
              //                           style: style.copyWith(
              //                             fontSize: 13,
              //                             color:
              //                                 AppColor.white.withOpacity(0.6),
              //                           ),
              //                         ),
              //                       );
              //                     }).toList(),
              //                   ),
              //                 ),
              //         ),
              //       );
              //     }
              //   },
              // ),
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
          child: StreamBuilder<List<Tasks>>(
            stream: provider.fetchAllTask(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  color: AppColor.primaryColor,
                );
              } else {
                var task = snapshot.data!;
                return Container(
                  color: AppColor.primaryColor,
                  child: ListView.builder(
                    itemCount: task.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        height: 56,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width / 22),
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
                                capitalizeAfterDot(task[index].taskName),
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
                                  value: task[index].status,
                                  onChanged: (newValue) async {
                                    await provider.updateTaskStatus(
                                      docID: task[index].id,
                                      status: newValue!,
                                    );
                                  },
                                  items: status.map((f) {
                                    return DropdownMenuItem<String>(
                                      value: f,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: f == 'Not Started'
                                              ? AppColor.lightGray
                                                  .withOpacity(0.3)
                                              : f == 'In Progress'
                                                  ? AppColor.yellow
                                                      .withOpacity(0.2)
                                                  : f == 'Completed'
                                                      ? AppColor.green
                                                          .withOpacity(0.2)
                                                      : AppColor.red
                                                          .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          f,
                                          style: style.copyWith(
                                            fontSize: 13,
                                            color: f == 'Not Started'
                                                ? AppColor.white
                                                    .withOpacity(0.8)
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
                                task[index].assignee,
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
                                    '${task[index].dueDate.day}  ${months[task[index].dueDate.month - 1]}, ${task[index].dueDate.year}',
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
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (_) => UpdateTask(
                                        task: task[index],
                                      ),
                                    ),
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
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (_) => RemoveTasks(
                                        tasks: task[index],
                                      ),
                                    ),
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
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
