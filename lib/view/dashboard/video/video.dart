import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/dashboard/video/create_category.dart';
import 'package:crisptv/view/dashboard/video/publish_video.dart';
import 'package:crisptv/view/dashboard/video/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.primaryColor.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: screenSize.width,
            margin: const EdgeInsets.only(bottom: 0.3),
            padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
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
                  'CATEGORIES:',
                  style: style.copyWith(
                    fontSize: 14,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(width: 20),
                StreamBuilder<List<Category>>(
                  stream: _category,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return buttonCircularIndicator;
                    } else {
                      var categories = snapshot.data!;
                      return Container(
                        height: 33,
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.8,
                                style: BorderStyle.solid,
                                color: AppColor.white.withOpacity(0.6)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              focusColor: AppColor.lightGray.withOpacity(0.5)),
                          child: categories.isEmpty
                              ? Center(
                                  child: Text(
                                    'No category created',
                                    style: style.copyWith(
                                        color: AppColor.white.withOpacity(0.8)),
                                  ),
                                )
                              : DropdownButtonHideUnderline(
                                  child: DropdownButton<Category>(
                                    dropdownColor: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                    hint: Text(
                                      'Select category',
                                      style: style.copyWith(
                                        fontSize: 13,
                                        color: AppColor.white.withOpacity(0.6),
                                      ),
                                    ),
                                    value: _selectedValue,
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
                                            color:
                                                AppColor.white.withOpacity(0.6),
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
                Expanded(child: Container()),
                InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => const CreateVideoCategory(),
                  ),
                  child: Container(
                    height: 33,
                    width: 157,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Create New Category',
                        style: style.copyWith(
                          fontSize: 13,
                          color: AppColor.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width / 20),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => const PublishVideo(),
                    );
                  },
                  child: Container(
                    height: 33,
                    width: 110,
                    decoration: BoxDecoration(
                      color: AppColor.lightGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Upload Video',
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
          Expanded(
            child: StreamBuilder<List<Posts>>(
              stream: provider.fetchAllPost('video'),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(color: AppColor.primaryColor);
                } else {
                  var videoPost = snapshot.data!
                      .where((element) => element.postType == 'video')
                      .toList();
                  if (_selectedValue == null) {
                    return VideoWidget(
                      videoPost: videoPost,
                      bulderRowNum: screenSize.width < 1500 ? 4 : 5,
                      length: videoPost.length,
                    );
                  } else {
                    var selectedPost = videoPost
                        .where((item) =>
                            _selectedValue!.id!.contains(item.categoryID))
                        .toList();
                    return VideoWidget(
                      videoPost: selectedPost,
                      bulderRowNum: screenSize.width < 1500 ? 4 : 5,
                      length: selectedPost.length,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
