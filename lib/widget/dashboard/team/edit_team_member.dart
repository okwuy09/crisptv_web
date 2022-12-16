import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/mytextform.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/video/successful_publish.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class EditTeamMemeber extends StatefulWidget {
  //String webImageUrl;
  final String name;
  const EditTeamMemeber({super.key, required this.name});

  @override
  State<EditTeamMemeber> createState() => _EditTeamMemeberState();
}

class _EditTeamMemeberState extends State<EditTeamMemeber> {
  TextEditingController? _controller;
  late DropzoneViewController controller;
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

  String? changeImageUrl;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.name);
    changeImageUrl =
        'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock--480x320.jpg';
    super.initState();
  }

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
                  'Edit Team Member Details',
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height / 40),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            color: AppColor.primaryColor.withOpacity(0.5),
                            strokeWidth: 3,
                            dashPattern: const [8, 4],
                            padding: EdgeInsets.zero,
                            radius: const Radius.circular(16),
                            child: Container(
                              height: screenSize.height / 2.3,
                              width: screenSize.width / 4,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: isHighLighted
                                    ? AppColor.lightGray.withOpacity(0.2)
                                    : AppColor.lightGray.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: NetworkImage(changeImageUrl!),
                                    fit: BoxFit.cover),
                              ),
                              child: Stack(
                                children: [
                                  DropzoneView(
                                    onCreated: (controller) =>
                                        this.controller = controller,
                                    onHover: () =>
                                        setState(() => isHighLighted = true),
                                    onLeave: () =>
                                        setState(() => isHighLighted = false),
                                    onDrop: acceptFile,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () async {
                                        final events =
                                            await controller.pickFiles();
                                        if (events.isEmpty) return;
                                        acceptFile(events.first);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 116,
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Change Picture',
                                            style: style.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.height / 30),
                          Text(
                            'Name',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 40,
                            width: 250,
                            child: MyTextForm(
                              controller: _controller,
                              obscureText: false,
                              borderColor: Colors.transparent,
                              hintText: 'Enter employee name',
                              fillColor: AppColor.primaryColor.withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Position',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 40,
                            width: 250,
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
                          SizedBox(height: screenSize.height / 10),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, false);
                              showDialog(
                                context: context,
                                builder: (_) => const SuccessUpload(
                                  title:
                                      'Team member details updated successfully!',
                                  subTitle: '',
                                  category: '',
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 250,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Update Team Member Details',
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
                    )
                  ],
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

  Future acceptFile(dynamic event) async {
    final url = await controller.createFileUrl(event);

    setState(() {
      isHighLighted = false;
      changeImageUrl = url;
    });
  }
}
