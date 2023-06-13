import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/view_comment.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/comment.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/buttom_bar.dart';
import 'package:crisptv/view/live_session/youtube_player.dart';
import 'package:crisptv/view/show/show_news.dart';
import 'package:crisptv/view/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../component/episodes_temp.dart';
import '../../component/style.dart';
import '../../component/webcomment.dart';
//import 'package:share_plus/share_plus.dart';

class VideoDetail extends StatefulWidget {
  final Posts videopost;
  const VideoDetail({super.key, required this.videopost});

  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  bool viewComment = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);
    var postProvider = Provider.of<PostController>(context);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: screenSize.width < 800
          ? Container()
          : Drawer(
              width: screenSize.width / 2.5,
              child: WebComment(
                postID: widget.videopost.id,
              ),
            ),
      body: TopBarContents(
        backgroundColor: AppColor.primaryColor,
        homeIndex: 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: screenSize.width / 20,
                  left: screenSize.width / 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Divider(
                      color: AppColor.white.withOpacity(0.4),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: screenSize.width < 800
                            ? screenSize.width / 30
                            : screenSize.width / 10,
                        left: screenSize.width < 800
                            ? screenSize.width / 30
                            : screenSize.width / 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height / 20),
                          screenSize.width < 800
                              ? InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColor.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: AppColor.white.withOpacity(0.9),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    height: 40,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColor.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color:
                                                AppColor.white.withOpacity(0.9),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            'Go Back',
                                            style: style.copyWith(
                                              color: AppColor.white
                                                  .withOpacity(0.9),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                          SizedBox(height: screenSize.height / 15),
                          // gride post display for pc and mobile devices
                          Text(
                            widget.videopost.title,
                            style: style.copyWith(
                              fontSize: 30,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(height: screenSize.height / 20),

                          /// Stream video
                          YoutubePlayerWidget(
                            videoURL: widget.videopost.videoUrl,
                          ),

                          SizedBox(height: screenSize.height / 10),
                          screenSize.width < 900
                              ? Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: screenSize.width,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                AppColor.white.withOpacity(0.6),
                                          )),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: AppColor.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                '235 Likes',
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Container(
                                                height: 20,
                                                width: 2,
                                                color: AppColor.white
                                                    .withOpacity(0.5),
                                              ),
                                              Expanded(child: Container()),
                                              Icon(
                                                Icons.mode_comment_outlined,
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                              const SizedBox(width: 8),

                                              /// comment count
                                              StreamBuilder<List<Comments>>(
                                                stream: postProvider
                                                    .fetchPostComment(
                                                        widget.videopost.id),
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData) {
                                                    return Container();
                                                  } else {
                                                    return Text(
                                                      '${snapshot.data!.length}  Comments'
                                                          .toString(),
                                                      style: style.copyWith(
                                                        fontSize: 14,
                                                        color: AppColor.white
                                                            .withOpacity(0.7),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          Divider(
                                              color: AppColor.white
                                                  .withOpacity(0.5)),
                                          Expanded(child: Container()),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Share to social',
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  onTap: () async {
                                                    // await Share.shareXFiles([
                                                    //   XFile('assets/hello.txt')
                                                    // ], text: 'Great picture')
                                                    //     .then(
                                                    //   (value) =>
                                                    //       ScaffoldMessenger.of(
                                                    //               context)
                                                    //           .showSnackBar(
                                                    //     SnackBar(
                                                    //       content: Text(
                                                    //           "Share result: ${value.status}"),
                                                    //     ),
                                                    //   ),
                                                    // );
                                                  },
                                                  child: Icon(
                                                    Icons.share,
                                                    color: AppColor.white
                                                        .withOpacity(0.7),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: ((context) {
                                            return SizedBox(
                                              height: screenSize.height / 1.2,
                                              child: ViewComment(
                                                  postID: widget.videopost.id),
                                            );
                                          }),
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        width: screenSize.width,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'View Comments',
                                            style: style.copyWith(
                                              fontSize: 14,
                                              color: AppColor.white
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Container(
                                  height: 127,
                                  width: screenSize.width,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.white.withOpacity(0.6),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: AppColor.white
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '235 Likes',
                                            style: style.copyWith(
                                              fontSize: 14,
                                              color: AppColor.white
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Icon(
                                            Icons.mode_comment_outlined,
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                          const SizedBox(width: 8),
                                          StreamBuilder<List<Comments>>(
                                            stream:
                                                postProvider.fetchPostComment(
                                                    widget.videopost.id),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Container();
                                              } else {
                                                return Text(
                                                  '${snapshot.data!.length}  Comment'
                                                      .toString(),
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.7),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Expanded(child: Container()),
                                          InkWell(
                                            onTap: () {
                                              _scaffoldKey.currentState!
                                                  .openEndDrawer();
                                            },
                                            child: Container(
                                              height: 36,
                                              width: 183,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColor.white
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'View Comments',
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Share to social',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              onTap: () async {
                                                // await Share.shareXFiles([
                                                //   XFile('assets/hello.txt')
                                                // ], text: 'Great picture')
                                                //     .then(
                                                //   (value) => ScaffoldMessenger.of(
                                                //           context)
                                                //       .showSnackBar(
                                                //     SnackBar(
                                                //       content: Text(
                                                //           "Share result: ${value.status}"),
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                              child: Icon(
                                                Icons.share,
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),

                    ///view comment
                    viewComment
                        ? Column(
                            children: [
                              SizedBox(height: screenSize.height / 15),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width < 800
                                        ? screenSize.width / 50
                                        : screenSize.width / 8),
                                child: ViewComment(
                                  postID: widget.videopost.id,
                                ),
                              ),
                            ],
                          )
                        : Container(),

                    SizedBox(height: screenSize.height / 10),
                    StreamBuilder<List<Category>>(
                        stream: provider.fetchAllVideoCategory(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          } else {
                            var videoCategory = snapshot.data!
                                .where((element) =>
                                    element.id == widget.videopost.categoryID)
                                .toList();
                            return EpisodesWidget(
                              videoCategory: videoCategory[0],
                              sectionTitle: 'MORE LIKE THIS',
                            );
                          }
                        }),
                    const SizedBox(height: 20),
                    const ShowNewsContainer(
                      sectionTitle: 'TRENDING NEWS',
                    ),
                  ],
                ),
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
