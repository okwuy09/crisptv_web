import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DragAndDropWidget extends StatefulWidget {
  const DragAndDropWidget({super.key});

  @override
  State<DragAndDropWidget> createState() => _DragAndDropWidgetState();
}

class _DragAndDropWidgetState extends State<DragAndDropWidget> {
  late DropzoneViewController controller;
  bool isHighLighted = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: screenSize.height / 1.5,
          width: screenSize.width,
          padding: EdgeInsets.all(screenSize.width / 40),
          margin: EdgeInsets.symmetric(
            horizontal: screenSize.width < 800
                ? screenSize.width / 15
                : screenSize.width / 4,
            vertical: screenSize.height / 8,
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(children: [
            DottedBorder(
              borderType: BorderType.RRect,
              color: AppColor.lightGray.withOpacity(0.2),
              strokeWidth: 3,
              dashPattern: const [8, 4],
              padding: EdgeInsets.zero,
              radius: const Radius.circular(16),
              child: Container(
                height: screenSize.height / 2.5,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: isHighLighted
                      ? AppColor.lightGray.withOpacity(0.3)
                      : AppColor.lightGray.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    DropzoneView(
                      onCreated: (controller) => this.controller = controller,
                      onHover: () => setState(() => isHighLighted = true),
                      onLeave: () => setState(() => isHighLighted = false),
                      onDrop: acceptFile,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload,
                            size: 80,
                            color: AppColor.white,
                          ),
                          Text(
                            'Drag and drop  the video here',
                            style: style.copyWith(
                              color: AppColor.primaryColor.withOpacity(0.6),
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '(acceptable file formats: .MP4, .MOV, .MKV)',
                            style: style.copyWith(
                              color: AppColor.primaryColor.withOpacity(0.4),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Text(
              '------------------ OR ------------------',
              style: style.copyWith(
                fontSize: 14,
                color: AppColor.primaryColor.withOpacity(0.8),
              ),
            ),
            Expanded(child: Container()),
            Container(
              height: 40,
              width: 260,
              decoration: BoxDecoration(
                color: AppColor.lightGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Select the file from your device',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
        Positioned(
          top: screenSize.height / 20,
          right: screenSize.width / 4,
          child: GestureDetector(
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
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    print('NAME: $name');
    print('MIME: $mime');
    print('BYTES: $bytes');
    print('URL: $url');

    setState(() => isHighLighted = false);
  }
}
