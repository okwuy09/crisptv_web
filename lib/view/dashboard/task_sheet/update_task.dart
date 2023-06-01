import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/datefield.dart';
import 'package:crisptv/component/mytextform.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/task.dart';
import 'package:crisptv/model/team.dart';
import 'package:crisptv/service/task_controller.dart';
import 'package:crisptv/service/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateTask extends StatefulWidget {
  final Tasks task;
  const UpdateTask({super.key, required this.task});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController? _taskName;
  DateTime? dueDate;
  String? selectedStatus;
  TeamMember? _selectedValue;
  String? assignee;
  late Stream<List<TeamMember>> _category; //= 'Choose from the dropdown';

  @override
  void initState() {
    assignee = widget.task.assignee;
    selectedStatus = widget.task.status;
    dueDate = widget.task.dueDate;
    _taskName = TextEditingController(text: widget.task.taskName);
    _category = Provider.of<UserController>(context, listen: false)
        .fetchAllTeamMember();
    super.initState();
  }

  List<String> status = [
    'Not Started',
    'In Progress',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<TaskController>(context);
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
                  : screenSize.width / 4.5,
              vertical: screenSize.height / 8,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                Text(
                  'Create New Task',
                  style: style.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: screenSize.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height / 40),
                          Text(
                            'Task Name',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 40,
                            width: 270,
                            child: MyTextForm(
                              controller: _taskName,
                              obscureText: false,
                              borderColor: Colors.transparent,
                              hintText: 'Enter task name',
                              fillColor: AppColor.primaryColor.withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Assign Team Members',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          StreamBuilder<List<TeamMember>>(
                            stream: _category,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return buttonCircularIndicator;
                              } else {
                                var categories = snapshot.data!;
                                return Container(
                                  height: 40,
                                  width: 270,
                                  padding: const EdgeInsets.only(left: 10.0),
                                  decoration: ShapeDecoration(
                                    color:
                                        AppColor.primaryColor.withOpacity(0.1),
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.8,
                                        style: BorderStyle.solid,
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        focusColor: AppColor.lightGray
                                            .withOpacity(0.5)),
                                    child: categories.isEmpty
                                        ? Center(
                                            child: Text(
                                              'No category created',
                                              style: style.copyWith(
                                                  color: AppColor.red
                                                      .withOpacity(0.8)),
                                            ),
                                          )
                                        : DropdownButtonHideUnderline(
                                            child: DropdownButton<TeamMember>(
                                              dropdownColor: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              hint: Text(
                                                assignee!,
                                                style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.primaryColor
                                                        .withOpacity(0.8)),
                                              ),
                                              value: _selectedValue,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedValue = newValue;
                                                  assignee = newValue!.userName;
                                                });
                                              },
                                              items: categories
                                                  .map((TeamMember f) {
                                                return DropdownMenuItem<
                                                    TeamMember>(
                                                  value: f,
                                                  child: Text(
                                                    capitalizeAfterDot(f
                                                        .userName
                                                        .toLowerCase()),
                                                    style: style.copyWith(
                                                      fontSize: 13,
                                                      color: AppColor
                                                          .primaryColor
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: screenSize.width / 40),
                    Expanded(child: Container()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.height / 30),
                          Text(
                            'Choose Status',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 40,
                            width: 270,
                            padding: const EdgeInsets.only(left: 10.0),
                            decoration: ShapeDecoration(
                              color: AppColor.primaryColor.withOpacity(0.1),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.8,
                                  style: BorderStyle.solid,
                                  color: Colors.transparent,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                focusColor: AppColor.lightGray.withOpacity(0.1),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: AppColor.white,
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
                                      child: Text(
                                        f,
                                        style: style.copyWith(
                                          fontSize: 13,
                                          color: f == 'Not Started'
                                              ? AppColor.primaryColor
                                                  .withOpacity(0.6)
                                              : AppColor.yellow,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Select Due Date',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          DateField(
                            onPressed: () => _taskDate(context),
                            pickedDate:
                                '${dueDate!.day} ${months[dueDate!.month - 1]}, ${dueDate!.year}',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenSize.height / 10),
                InkWell(
                  onTap: () async {
                    await provider.updateTask(
                      context: context,
                      assignee: assignee!,
                      dueDate: dueDate!,
                      status: selectedStatus!,
                      taskName: _taskName!.text,
                      docID: widget.task.id,
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 146,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: provider.isUpdatingTask
                          ? buttonCircularIndicator
                          : Text(
                              'Update Task',
                              style: style.copyWith(
                                fontSize: 14,
                                color: AppColor.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height / 20,
            right: screenSize.width / 4.5,
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

  _taskDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: dueDate!,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (selected != null && selected != dueDate) {
      setState(() {
        dueDate = selected;
      });
    }
  }
}
