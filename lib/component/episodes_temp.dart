import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EpisodesWidget extends StatefulWidget {
  const EpisodesWidget(
      {super.key, required this.sectionTitle, this.videoCategory});
  final String sectionTitle;
  final Category? videoCategory;

  @override
  State<EpisodesWidget> createState() => _EpisodesWidgetState();
}

class _EpisodesWidgetState extends State<EpisodesWidget> {
  final ScrollController _controller = ScrollController();

  bool isMaxlength = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    var categoryProvider = Provider.of<CategoryController>(context);
    return StreamBuilder<List<Posts>>(
      stream: provider.fetchAllPost('video'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          var videoPosts = snapshot.data!
              .where((element) => element.postType == 'video')
              .toList();

          var videoPost = videoPosts
              .where(
                  (element) => element.categoryID == widget.videoCategory!.id)
              .toList();
          return SizedBox(
            height: screenSize.width < 800 ? 300 : 350,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.sectionTitle,
                style: style.copyWith(
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      controller: _controller,
                      itemCount: videoPost.length > 6 ? 6 : videoPost.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () => context.pushNamed(
                                "video_detail",
                                pathParameters: {
                                  "videodetail": videoPost[index].title,
                                },
                                extra: videoPost[index],
                              ),
                              child: Container(
                                width: screenSize.width < 800 ? 270 : 320,
                                height: screenSize.width < 800 ? 160 : 205,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  //borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    image: NetworkImage(videoPost[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: InkWell(
                                onTap: () => context.pushNamed(
                                  "video_detail",
                                  pathParameters: {
                                    "videodetail": videoPost[index].title,
                                  },
                                  extra: videoPost[index],
                                ),
                                child: Container(
                                  width: screenSize.width < 800 ? 270 : 320,
                                  height: screenSize.width < 800 ? 100 : 100,
                                  color: AppColor.gray.withOpacity(0.95),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        videoPost[index].title,
                                        style: style.copyWith(
                                          fontSize: 14,
                                          color: AppColor.white,
                                        ),
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 10),
                                      StreamBuilder<List<Category>>(
                                          stream: categoryProvider
                                              .fetchAllVideoCategory(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Container();
                                            } else {
                                              var category = snapshot.data!
                                                  .where((e) => e.id!.contains(
                                                      videoPost[index]
                                                          .categoryID))
                                                  .toList();
                                              return Text(
                                                '${category[0].name} | 0${videoPost[index].time.day.toDouble()}. 0${videoPost[index].time.month.toDouble()}. ${videoPost[index].time.year}',
                                                style: style.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColor.white
                                                      .withOpacity(0.6),
                                                ),
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    screenSize.width < 800
                        ? Container()
                        : videoPost.length < 5
                            ? Container()
                            : Positioned(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      isMaxlength
                                          ? InkWell(
                                              onTap: () {
                                                _controller
                                                    .animateTo(
                                                      _controller.position
                                                          .minScrollExtent,
                                                      duration: const Duration(
                                                          milliseconds: 1000),
                                                      curve: Curves.ease,
                                                    )
                                                    .then((value) => setState(
                                                        (() => isMaxlength =
                                                            !isMaxlength)));
                                              },
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: AppColor.gray
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.arrow_back_ios,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      Expanded(child: Container()),
                                      isMaxlength
                                          ? const SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                _controller
                                                    .animateTo(
                                                      _controller.position
                                                          .maxScrollExtent,
                                                      duration: const Duration(
                                                          milliseconds: 1000),
                                                      curve: Curves.ease,
                                                    )
                                                    .then((value) => setState(
                                                        (() => isMaxlength =
                                                            !isMaxlength)));
                                              },
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: AppColor.gray
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ]),
          );
        }
      },
    );
  }
}
