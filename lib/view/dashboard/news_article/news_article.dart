import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/constant.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:crisptv_media/view/dashboard/news_article/create_news_category.dart';
import 'package:crisptv_media/view/dashboard/news_article/news_widget.dart';
import 'package:crisptv_media/view/dashboard/news_article/text_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsArticles extends StatefulWidget {
  const NewsArticles({Key? key}) : super(key: key);

  @override
  State<NewsArticles> createState() => _VideosState();
}

class _VideosState extends State<NewsArticles> {
  bool writearticle = false;

  Category? _selectedValue;
  late Stream<List<Category>> _category; //= 'Choose from the dropdown';

  @override
  void initState() {
    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllNewsCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    return Stack(
      children: [
        writearticle
            ? const TextEditor()
            : Column(
                children: [
                  Container(
                    height: 80,
                    width: screenSize.width,
                    margin: const EdgeInsets.only(bottom: 0.3),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenSize.width / 20),
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
                                      color: AppColor.white.withOpacity(0.6),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                  ),
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      focusColor:
                                          AppColor.lightGray.withOpacity(0.5)),
                                  child: categories.isEmpty
                                      ? Center(
                                          child: Text(
                                            'No category created',
                                            style: style.copyWith(
                                                color: AppColor.white
                                                    .withOpacity(0.8)),
                                          ),
                                        )
                                      : DropdownButtonHideUnderline(
                                          child: DropdownButton<Category>(
                                            dropdownColor:
                                                AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            value:
                                                _selectedValue ?? categories[0],
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
                                                    color: AppColor.white
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
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () => showDialog(
                            context: context,
                            builder: (_) => const CreateNewsCategory(),
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
                            // context.goNamed(
                            //   "new_article",
                            //   params: {"name": "new_article"},
                            // );
                            setState(() {
                              writearticle = true;
                            });
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
                                'New Article',
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
                      stream: provider.fetchAllPost('news'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container(color: AppColor.primaryColor);
                        } else {
                          var newsPost = snapshot.data!
                              .where((element) => element.postType == 'news')
                              .toList();
                          if (_selectedValue == null) {
                            return NewsWidget(
                              newsPost: newsPost,
                              bulderRowNum: 4,
                              length: newsPost.length,
                            );
                          } else {
                            var selectedPost = newsPost
                                .where((item) => _selectedValue!.id
                                    .contains(item.categoryID))
                                .toList();
                            return NewsWidget(
                              newsPost: selectedPost,
                              bulderRowNum: 4,
                              length: selectedPost.length,
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
        writearticle
            ? Positioned(
                left: screenSize.width / 20,
                child: InkWell(
                  onTap: (() {
                    setState(() {
                      writearticle = false;
                    });
                  }),
                  child: Container(
                    height: 36,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.lightGray,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          //size: 25,
                          color: AppColor.white.withOpacity(0.6),
                        ),
                        Text(
                          'Back',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
