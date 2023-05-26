import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/view/show/show_news.dart';
import 'package:crisptv_media/view/show/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import '../../component/style.dart';

class VideoFeedWidget extends StatefulWidget {
  final List<Posts> videopost;
  const VideoFeedWidget({super.key, required this.videopost});

  @override
  State<VideoFeedWidget> createState() => _VideoFeedWidgetState();
}

class _VideoFeedWidgetState extends State<VideoFeedWidget> {
  final int _numPages = 10;
  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);
    return StreamBuilder<List<Category>>(
        stream: provider.fetchAllVideoCategory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var category = snapshot.data!;
            var postCategory = category
                .where(
                    (element) => element.id == widget.videopost[0].categoryID)
                .toList();
            return Padding(
              padding: EdgeInsets.only(
                top: screenSize.width / 15,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalizeAfterDot(postCategory[0].name.toLowerCase()),
                    style: style.copyWith(
                      color: AppColor.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  // Video widget
                  screenSize.width < 800
                      ? ListView.builder(
                          itemCount: widget.videopost.length,
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
                                              widget.videopost[index].image),
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
                                                videopost: widget.videopost[
                                                    index]) // PublishVideo(),
                                            ),
                                        child: Container(
                                          width: screenSize
                                              .width, //< 800 ? 220 : 295,
                                          height:
                                              screenSize.width < 800 ? 85 : 72,
                                          color:
                                              AppColor.gray.withOpacity(0.95),
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.videopost[index].title,
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                '${postCategory[0].name} | 0${widget.videopost[index].time.day.toDouble()}. 0${widget.videopost[index].time.month.toDouble()}. ${widget.videopost[index].time.year}',
                                                style: style.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
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
                          itemCount: widget.videopost.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenSize.width < 800 ? 3 : 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: ((context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 300,
                                  width: screenSize.width < 800 ? 220 : 294,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    //borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          widget.videopost[index].image),
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
                                                  widget.videopost[index],
                                            ) // PublishVideo(),
                                        ),
                                    child: Container(
                                      width: screenSize.width < 800 ? 220 : 295,
                                      height: screenSize.width < 800 ? 85 : 72,
                                      color: AppColor.gray.withOpacity(0.95),
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.videopost[index].title,
                                            style: style.copyWith(
                                              fontSize: 14,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            '${postCategory[0].name} |  0${widget.videopost[index].time.day.toDouble()}. 0${widget.videopost[index].time.month.toDouble()}. ${widget.videopost[index].time.year}',
                                            style: style.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
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
                            );
                          }),
                        ),

                  const SizedBox(height: 40),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenSize.width / 20),
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
              ),
            );
          }
        });
  }
}
