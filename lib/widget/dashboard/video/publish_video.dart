import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/mytextform.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/video/successful_publish.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class PublishVideo extends StatefulWidget {
  final String videoUrl;
  const PublishVideo({super.key, required this.videoUrl});

  @override
  State<PublishVideo> createState() => _PublishVideoState();
}

class _PublishVideoState extends State<PublishVideo> {
  String? webImageUrl;
  final TextEditingController _controller = TextEditingController();
  late DropzoneViewController controller;
  bool isHighLighted = false;
  String selectedValue = 'Choose the video category';
  List<String> dropDownItem = [
    'Choose the video category',
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

  // String? fileName;

  // getvideoImage() async {
  //   fileName = await VideoThumbnail.thumbnailFile(
  //     video: widget.videoUrl,
  //     thumbnailPath: ( getTemporaryDirectory()).path,
  //     imageFormat: ImageFormat.WEBP,
  //     maxHeight: 64,
  //     quality: 75,
  //   );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color:
                                            AppColor.lightGray.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(widget.videoUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 10,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 51,
                                            width: 51,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffC7FEE3),
                                              borderRadius:
                                                  BorderRadius.circular(61),
                                            ),
                                          ),
                                          Positioned(
                                            left: 9,
                                            top: 9,
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff4BC187),
                                                borderRadius:
                                                    BorderRadius.circular(61),
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: AppColor.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Video Upload Successful',
                                      style: style.copyWith(
                                        //fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '35 Mins',
                                      style: style.copyWith(
                                        color: AppColor.primaryColor
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: screenSize.height / 40),
                            webImageUrl == null
                                ? DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: AppColor.lightGray.withOpacity(0.1),
                                    strokeWidth: 3,
                                    dashPattern: const [8, 4],
                                    padding: EdgeInsets.zero,
                                    radius: const Radius.circular(16),
                                    child: Container(
                                      height: screenSize.height / 3.1,
                                      width: screenSize.width / 4,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: isHighLighted
                                            ? AppColor.lightGray
                                                .withOpacity(0.2)
                                            : AppColor.lightGray
                                                .withOpacity(0.1),
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
                                    height: screenSize.height / 3.1,
                                    width: screenSize.width / 4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      //color: AppColor.gray,
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: NetworkImage(webImageUrl!),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          ]),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.height / 10),
                          Text(
                            'Video Title',
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
                              hintText: 'Enter video title here',
                              fillColor: AppColor.primaryColor.withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Video Category',
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
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                    showDialog(
                      context: context,
                      builder: (_) => SuccessUpload(
                        title: 'Your video has been published successfully',
                        subTitle: 'The video was published under',
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
