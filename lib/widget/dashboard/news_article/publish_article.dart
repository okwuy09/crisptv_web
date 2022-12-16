import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/video/successful_publish.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class PublishArticle extends StatefulWidget {
  const PublishArticle({super.key});

  @override
  State<PublishArticle> createState() => _PublishArticleState();
}

class _PublishArticleState extends State<PublishArticle> {
  String? webImageUrl;
  late DropzoneViewController controller;
  bool isHighLighted = false;
  bool allowCommenting = false;
  String selectedValue = 'Choose article category';
  List<String> dropDownItem = [
    'Choose article category',
    'POLITICS NOW',
    'TECH',
    'BUSINESS',
    'MEDIA',
    'CAREER/LIFE HACKS',
  ];

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add a header image',
                            style: style.copyWith(fontSize: 24),
                          ),
                          SizedBox(height: screenSize.height / 20),
                          webImageUrl == null
                              ? DottedBorder(
                                  borderType: BorderType.RRect,
                                  color: AppColor.lightGray.withOpacity(0.1),
                                  strokeWidth: 3,
                                  dashPattern: const [8, 4],
                                  padding: EdgeInsets.zero,
                                  radius: const Radius.circular(16),
                                  child: Container(
                                    height: screenSize.height / 2.8,
                                    width: screenSize.width / 3.5,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: isHighLighted
                                          ? AppColor.lightGray.withOpacity(0.2)
                                          : AppColor.lightGray.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          onCreated: (controller) =>
                                              this.controller = controller,
                                          onHover: () => setState(
                                              () => isHighLighted = true),
                                          onLeave: () => setState(
                                              () => isHighLighted = false),
                                          onDrop: acceptFile,
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.cloud_upload,
                                                size: 50,
                                                color: AppColor.white,
                                              ),
                                              Text(
                                                'Drag and drop  the video here',
                                                style: style.copyWith(
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                '(acceptable file formats: .MP4, .MOV, .MKV)',
                                                style: style.copyWith(
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.5),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Text(
                                                '------------------ OR ------------------',
                                                style: style.copyWith(
                                                  fontSize: 12,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              InkWell(
                                                onTap: () async {
                                                  final events =
                                                      await controller
                                                          .pickFiles();
                                                  if (events.isEmpty) return;
                                                  acceptFile(events.first);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.lightGray,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Select the file from your device',
                                                      style: style.copyWith(
                                                        fontSize: 12,
                                                        color: AppColor.white
                                                            .withOpacity(0.8),
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
                                  ),
                                )
                              : Container(
                                  height: screenSize.height / 2.8,
                                  width: screenSize.width / 3.5,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    //color: AppColor.gray,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage(webImageUrl!),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
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
                                              'Change Cover',
                                              style: style.copyWith(
                                                fontSize: 13,
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
                    ),
                    SizedBox(width: screenSize.width / 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.height / 10),
                          Text(
                            'Allow commenting',
                            style: style.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Switch(
                            value: allowCommenting,
                            activeColor: AppColor.primaryColor,
                            onChanged: ((value) {
                              setState(() {
                                allowCommenting = value;
                              });
                            }),
                          ),
                          SizedBox(height: screenSize.height / 35),
                          Text(
                            'Select Category',
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
                          SizedBox(height: screenSize.height / 15),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, false);
                              showDialog(
                                context: context,
                                builder: (_) => SuccessUpload(
                                  title:
                                      'Your article has been published successfully',
                                  subTitle: 'The article was published under',
                                  category: selectedValue,
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 170,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Publish Now',
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
      webImageUrl = url;
    });
  }
}
