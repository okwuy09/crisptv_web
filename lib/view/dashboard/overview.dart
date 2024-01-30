import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/dashboard/news_article/news_widget.dart';
import 'package:crisptv/view/dashboard/video/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Overview extends StatefulWidget {
  final void Function()? moreVideo;
  final void Function()? moreNews;
  const Overview({Key? key, required this.moreVideo, required this.moreNews})
      : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
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
                    children: [
                      Text(
                        'RECENTLY UPLOADED VIDEOS',
                        style: style.copyWith(
                          fontSize: 14,
                          color: AppColor.white.withOpacity(0.6),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: widget.moreVideo,
                        child: Container(
                          height: 33,
                          width: 93,
                          decoration: BoxDecoration(
                            color: AppColor.lightGray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'View More',
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

                        return VideoWidget(
                          videoPost: videoPost,
                          bulderRowNum: screenSize.width < 1500 ? 2 : 3,
                          length: videoPost.length > 10 ? 10 : videoPost.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          /// Article Post

          Expanded(
            child: Column(
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
                      color: AppColor.primaryColor.withOpacity(0.6),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'RECENT ARTICLES',
                        style: style.copyWith(
                          fontSize: 14,
                          color: AppColor.white.withOpacity(0.5),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: widget.moreNews,
                        child: Container(
                          height: 33,
                          width: 93,
                          decoration: BoxDecoration(
                            color: AppColor.lightGray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'View More',
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

                        return NewsWidget(
                          newsPost: newsPost,
                          bulderRowNum: screenSize.width < 1500 ? 2 : 3,
                          length: newsPost.length > 10 ? 10 : newsPost.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
