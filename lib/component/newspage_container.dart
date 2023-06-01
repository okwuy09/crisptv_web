import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/post_detail.dart';

class NewsPageContainer extends StatefulWidget {
  const NewsPageContainer(
      {super.key,
      required this.sectionTitle,
      required this.newsCategory,
      this.onTap});
  final String sectionTitle;
  final Category? newsCategory;
  final Function()? onTap;

  @override
  State<NewsPageContainer> createState() => _NewsPageContainerState();
}

class _NewsPageContainerState extends State<NewsPageContainer> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                widget.sectionTitle,
                style: style.copyWith(
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: 40,
                  width: 93,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'View more',
                      style: style.copyWith(
                        color: AppColor.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: screenSize.height / 20),
          SizedBox(
            height: screenSize.width < 800 ? null : 280,
            child: StreamBuilder<List<Posts>>(
                stream: provider.fetchAllPost('news'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    var newsPosts = snapshot.data!
                        .where((element) => element.postType == 'news')
                        .toList();

                    var newsPost = newsPosts
                        .where((element) =>
                            element.categoryID == widget.newsCategory!.id)
                        .toList();
                    return ListView.builder(
                      controller: _controller,
                      itemCount: newsPost.length > 6 ? 6 : newsPost.length,
                      scrollDirection: screenSize.width < 800
                          ? Axis.vertical
                          : Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: screenSize.width < 800
                              ? const EdgeInsets.only(bottom: 10)
                              : const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        PostDetail(newsPost: newsPost[index]),
                                  ),
                                ),
                                child: Container(
                                  height: 180,
                                  width: screenSize.width < 800
                                      ? screenSize.width
                                      : 284,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(newsPost[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              //
                              Container(
                                width: screenSize.width < 800
                                    ? screenSize.width
                                    : 284,
                                height: 80,
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newsPost[index].title,
                                      style: style.copyWith(
                                        fontSize: 14,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PostDetail(
                                              newsPost: newsPost[index]),
                                        ),
                                      ),
                                      child: Text(
                                        'READ MORE',
                                        style: style.copyWith(
                                          color: AppColor.blue,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ]);
  }
}
