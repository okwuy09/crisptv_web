import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/buttom_bar.dart';
import 'package:crisptv/view/show/popular.dart';
import 'package:crisptv/view/show/video_feed_widget.dart';
import 'package:crisptv/view/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({super.key});

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  final ScrollController _scrollController = ScrollController();
  Category? selectedCategory;
  late Stream<List<Category>> _category;
  @override
  void initState() {
    super.initState();

    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllVideoCategory();
    //selectedCategory = widget.selectedPage;
  }

  var selectedPage = "Popular";

  // Capitalize text after dot

  String capitalizeAfterDot(String text) {
    final split = text.replaceAll(RegExp(r'\.\s+'), ' #').split(' ');
    String result = split.reduce((a, b) {
      if (b.startsWith('#')) {
        return a + b.replaceRange(0, 2, '. ${b[1].toUpperCase()}');
      }
      return '$a $b';
    });

    return result.replaceRange(0, 1, result[0].toUpperCase());
  }

  bool onclicked = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 1,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 70),
          child: Stack(
            children: [
              Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      color: AppColor.white.withOpacity(0.5),
                      height: 0,
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: StreamBuilder<List<Category>>(
                        stream: _category,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          } else {
                            var category = snapshot.data!;
                            return SizedBox(
                              height: 38,
                              child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: category.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = category[index];
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 4,
                                        ),
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                            color: selectedCategory?.id ==
                                                    category[index].id
                                                ? AppColor.white
                                                    .withOpacity(0.5)
                                                : AppColor.primaryColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            capitalizeAfterDot(category[index]
                                                .name
                                                .toLowerCase()),
                                            style: style.copyWith(
                                              fontSize: 15,
                                              color: selectedCategory?.id ==
                                                      category[index].id
                                                  ? AppColor.white
                                                      .withOpacity(0.9)
                                                  : AppColor.white
                                                      .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                    Divider(
                      color: AppColor.white.withOpacity(0.5),
                      height: 0,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: screenSize.width / 20,
                top: 15,
                child: IconButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<Posts>>(
                stream: provider.fetchAllPost('video'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    var videoPost = snapshot.data!
                        .where((element) => element.postType == 'video')
                        .toList();
                    if (selectedCategory == null) {
                      return const PopularVideo();
                    } else {
                      var selectedPost = videoPost
                          .where((item) =>
                              selectedCategory!.id.contains(item.categoryID))
                          .toList();
                      return VideoFeedWidget(videopost: selectedPost);
                    }
                  }
                },
              ),
              SizedBox(height: screenSize.height / 5),
              const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
