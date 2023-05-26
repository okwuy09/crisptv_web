import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:crisptv_media/view/buttom_bar.dart';
import 'package:crisptv_media/view/news/news_feed_widget.dart';
import 'package:crisptv_media/view/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'trending.dart';

// ignore: must_be_immutable
class NewsPage extends StatefulWidget {
  NewsPage({super.key, this.selectedPage});
  Category? selectedPage;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollController = ScrollController();

  Category? selectedCategory;
  late Stream<List<Category>> _category;
  @override
  void initState() {
    super.initState();

    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllNewsCategory();
    selectedCategory = widget.selectedPage;
  }

  bool onclicked = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 2,
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
                                            category[index].name,
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
              stream: provider.fetchAllPost('news'),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  var newsPost = snapshot.data!
                      .where((element) => element.postType == 'news')
                      .toList();
                  if (selectedCategory == null) {
                    return const TreandingNews();
                  } else {
                    var selectedPost = newsPost
                        .where((item) =>
                            selectedCategory!.id.contains(item.categoryID))
                        .toList();
                    return NewsFeedWidget(newspost: selectedPost);
                  }
                }
              },
            ),
            SizedBox(height: screenSize.height / 5),
            const BottomBar(),
          ],
        )),
      ),
    );
  }
}
