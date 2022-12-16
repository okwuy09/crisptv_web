import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/datefield.dart';
import 'package:crisptv_media/component/mytextform.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/video/successful_publish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _controller = TextEditingController();
  late DropzoneViewController controller;
  DateTime dueDate = DateTime.now();
  bool isHighLighted = false;
  String selectedValue = 'Choose team member position';
  List<String> dropDownItem = [
    'Choose team member position',
    'Team Lead',
    'Asst. Team Lead',
    'Chief Video Editor',
    'Video Editor',
    'Copywriter',
    'Animator',
  ];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> status = [
    'Not Started',
    'In Progress',
  ];
  String selectedStatus = 'Not Started';

  String? changeImageUrl;
  // @override
  // void initState() {
  //   changeImageUrl =
  //       'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock--480x320.jpg';
  //   super.initState();
  // }

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
                              controller: _controller,
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
                                  value: selectedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: dropDownItem.map((f) {
                                    return DropdownMenuItem<String>(
                                      value: f,
                                      child: Text(
                                        f.toString(),
                                        style: style.copyWith(
                                          fontSize: 13,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
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
                                '${dueDate.day} ${months[dueDate.month - 1]}, ${dueDate.year}',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenSize.height / 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                    showDialog(
                      context: context,
                      builder: (_) => const SuccessUpload(
                        title: 'Task has been successfully created',
                        subTitle:
                            'The asignees would be notified about the tasks given to them',
                        category: '',
                      ),
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
                      child: Text(
                        'Create Task',
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
      initialDate: dueDate,
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
