import 'dart:typed_data';
import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/service/setting_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:provider/provider.dart';

class UploadAds extends StatefulWidget {
  final String type;
  const UploadAds({
    super.key,
    required this.type,
  });

  @override
  State<UploadAds> createState() => _UploadAdsState();
}

class _UploadAdsState extends State<UploadAds> {
  String? imageName;
  String selectedValue = 'Choose the video category';
  String? webImageUrl;
  Uint8List? imagefile;
  late DropzoneViewController controller;
  bool isHighLighted = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<SettingController>(context);
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
                  : screenSize.width / 3,
              vertical: screenSize.height / 8,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Add image',
                        style: style.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
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
                                      onHover: () =>
                                          setState(() => isHighLighted = true),
                                      onLeave: () =>
                                          setState(() => isHighLighted = false),
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
                                                  await controller.pickFiles();
                                              if (events.isEmpty) return;
                                              acceptFile(events.first);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                color: AppColor.lightGray,
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                        borderRadius: BorderRadius.circular(8),
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
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () async {
                          if (imagefile!.isNotEmpty) {
                            if (widget.type == 'ads1') {
                              await provider.uploadAds1(
                                  context: context,
                                  imageURL: imagefile!,
                                  imageName: imageName!,
                                  type: 'ads1');
                            } else if (widget.type == 'ads2') {
                              await provider.uploadAds2(
                                  context: context,
                                  imageURL: imagefile!,
                                  imageName: imageName!,
                                  type: 'ads2');
                            } else {
                              await provider.uploadSlide(
                                  context: context,
                                  imageURL: imagefile!,
                                  imageName: imageName!);
                            }
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 170,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: provider.ispostingAds
                                ? buttonCircularIndicator
                                : Text(
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
              ],
            ),
          ),
          Positioned(
            top: screenSize.height / 20,
            right: screenSize.width / 3,
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
    final file = await controller.getFileData(event);
    final name = await controller.getFilename(event);

    setState(() {
      isHighLighted = false;
      imagefile = file;
      imageName = name;
      webImageUrl = url;
    });
  }
}
