import 'dart:typed_data';

import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/mytextform.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/constant.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublishVideo extends StatefulWidget {
  const PublishVideo({
    super.key,
  });

  @override
  State<PublishVideo> createState() => _PublishVideoState();
}

class _PublishVideoState extends State<PublishVideo> {
  final TextEditingController _videoURL = TextEditingController();
  final TextEditingController _videoTitle = TextEditingController();
  String imageName = 'image';
  String selectedValue = 'Choose the video category';

  Category? _selectedValue;
  late Stream<List<Category>> _category; //= 'Choose from the dropdown';

  @override
  void initState() {
    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllVideoCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
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
            child: Column(
              children: [
                SizedBox(width: screenSize.width / 40),
                Text(
                  'Publish New Video',
                  style: style.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // textfield for video Title
                    Text(
                      'Video Title',
                      style: style.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: MyTextForm(
                        controller: _videoTitle,
                        obscureText: false,
                        borderColor: Colors.transparent,
                        hintText: 'Enter video title here',
                        fillColor: AppColor.primaryColor.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // textfield for video URL
                    Text(
                      'Video URL',
                      style: style.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: MyTextForm(
                        controller: _videoURL,
                        obscureText: false,
                        borderColor: Colors.transparent,
                        hintText: 'Enter video URL here',
                        fillColor: AppColor.primaryColor.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // textfield for video Category
                    Text(
                      'Video Category',
                      style: style.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 5),

                    StreamBuilder<List<Category>>(
                      stream: _category,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return buttonCircularIndicator;
                        } else {
                          var categories = snapshot.data!;
                          return Container(
                            height: 40,
                            width: 300,
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
                              child: categories.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No category created',
                                        style: style.copyWith(
                                            color: AppColor.primaryColor
                                                .withOpacity(0.8)),
                                      ),
                                    )
                                  : DropdownButtonHideUnderline(
                                      child: DropdownButton<Category>(
                                        dropdownColor: AppColor.white,
                                        borderRadius: BorderRadius.circular(8),
                                        value: _selectedValue ?? categories[0],
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedValue = newValue;
                                          });
                                        },
                                        items: categories.map((Category f) {
                                          return DropdownMenuItem<Category>(
                                            value: f,
                                            child: Text(
                                              f.name.toUpperCase(),
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
                          );
                        }
                      },
                    ),
                  ],
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () async {
                    await provider.posts(
                      context: context,
                      posterName: 'okwuchukwu',
                      imageName: imageName,
                      category: _selectedValue!,
                      title: _videoTitle.text.trim(),
                      videoUrl: _videoURL.text.trim(),
                      allowComment: true,
                      postType: 'video',
                      writeUp: '',
                      imageFile: Uint8List(8),
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
                      child: provider.isposting
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
}
