import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/show/show_news.dart';
import 'package:crisptv/view/show/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class PopularVideo extends StatefulWidget {
  const PopularVideo({super.key});

  @override
  State<PopularVideo> createState() => _PopularVideoState();
}

class _PopularVideoState extends State<PopularVideo> {
  final int _numPages = 10;
  // ignore: unused_field
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);
    var postProvider = Provider.of<PostController>(context);
    return StreamBuilder<List<Category>>(
      stream: provider.fetchAllVideoCategory(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          var postCategory = snapshot.data!;
          return Padding(
            padding: EdgeInsets.only(
              top: screenSize.height / 25,
              right: screenSize.width / 20,
              left: screenSize.width / 20,
            ),
            child: StreamBuilder<List<Posts>>(
                stream: postProvider.fetchAllPost('video'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    var videoPost = snapshot.data!
                        .where((element) => element.postType == 'video')
                        .toList();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Watch & Stream hundreds of educating, inspiring and entertaining videos.',
                          style: style.copyWith(
                            color: AppColor.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: screenSize.height / 15),
                        // Video widget
                        screenSize.width < 800
                            ? ListView.builder(
                                itemCount: videoPost.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 320,
                                            width: screenSize
                                                .width, // < 800 ? 220 : 294,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              //borderRadius: BorderRadius.circular(6),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    videoPost[index].image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: InkWell(
                                              onTap: () => showDialog(
                                                  context: context,
                                                  builder: (_) => VideoDetail(
                                                        videopost:
                                                            videoPost[index],
                                                      ) // PublishVideo(),
                                                  ),
                                              child: Container(
                                                width: screenSize
                                                    .width, //< 800 ? 220 : 295,
                                                height: screenSize.width < 800
                                                    ? 85
                                                    : 72,
                                                color: AppColor.gray
                                                    .withOpacity(0.95),
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        videoPost[index].title,
                                                        style: style.copyWith(
                                                          fontSize: 14,
                                                          color: AppColor.white,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      '${postCategory[0].name} | 0${videoPost[index].time.day.toDouble()}. 0${videoPost[index].time.month.toDouble()}. ${videoPost[index].time.year}',
                                                      style: style.copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColor.white
                                                            .withOpacity(0.6),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10)
                                    ],
                                  );
                                }),
                              )
                            : GridView.builder(
                                itemCount: videoPost.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: screenSize.width < 800
                                      ? 3
                                      : screenSize.width < 1500
                                          ? 4
                                          : 5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 300,
                                ),
                                itemBuilder: ((context, index) {
                                  return SizedBox(
                                    height: 300,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (_) => VideoDetail(
                                                  videopost: videoPost[
                                                      index]) // PublishVideo(),
                                              ),
                                          child: Container(
                                            height: 210,
                                            width: screenSize.width < 800
                                                ? 220
                                                : 294,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              //borderRadius: BorderRadius.circular(6),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    videoPost[index].image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => showDialog(
                                              context: context,
                                              builder: (_) => VideoDetail(
                                                  videopost: videoPost[
                                                      index]) // PublishVideo(),
                                              ),
                                          child: Container(
                                            width: screenSize.width < 800
                                                ? 220
                                                : 295,
                                            // height: screenSize.width < 800
                                            //     ? 85
                                            //     : 72,
                                            color:
                                                AppColor.gray.withOpacity(0.95),
                                            padding: const EdgeInsets.all(12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  child: Text(
                                                    videoPost[index].title,
                                                    style: style.copyWith(
                                                      fontSize: 14,
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  '${postCategory[0].name} |  0${videoPost[index].time.day.toDouble()}. 0${videoPost[index].time.month.toDouble()}. ${videoPost[index].time.year}',
                                                  style: style.copyWith(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColor.white
                                                        .withOpacity(0.6),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),

                        const SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 20),
                          child: NumberPaginator(
                            numberPages: _numPages,
                            onPageChange: (int index) {
                              setState(() {
                                _currentIndex =
                                    index; // _currentPage is a variable within State of StatefulWidget
                              });
                            },
                            config: NumberPaginatorUIConfig(
                              // default height is 48
                              height: 48,
                              buttonShape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),

                              buttonSelectedForegroundColor: AppColor.white,
                              buttonUnselectedForegroundColor:
                                  AppColor.white.withOpacity(0.3),
                              buttonUnselectedBackgroundColor:
                                  AppColor.gray.withOpacity(0.5),
                              buttonSelectedBackgroundColor:
                                  AppColor.white.withOpacity(0.3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          height: screenSize.width < 800 ? 180 : 404,
                          width: screenSize.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/ads.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const ShowNewsContainer(
                          sectionTitle: 'LATEST NEWS AND UPDATES',
                        ),
                      ],
                    );
                  }
                }),
          );
        }
      },
    );
  }
}
