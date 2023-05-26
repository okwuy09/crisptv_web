import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    return StreamBuilder<List<Posts>>(
        stream: provider.fetchAllPost('video'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var videoPost = snapshot.data!
                .where((element) => element.postType == 'video')
                .toList();

            return Container(
              height: screenSize.width < 800 ? 350 : 450,
              width: screenSize.width,
              margin: EdgeInsets.only(top: screenSize.height / 7),
              padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'EXPLORE OUR SHOWS',
                    style: style.copyWith(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: screenSize.width < 800 ? 240 : 350,
                    child: Stack(
                      children: [
                        ListView.builder(
                          controller: _controller,
                          itemCount:
                              videoPost.length > 6 ? 6 : videoPost.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () => context.goNamed(
                                    "video_detail",
                                    pathParameters: {
                                      "videodetail": videoPost[index].title,
                                    },
                                    extra: videoPost[index],
                                  ),
                                  child: Container(
                                    height: screenSize.width < 800 ? 320 : 350,
                                    width: screenSize.width < 800 ? 270 : 300,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            videoPost[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () => context.goNamed(
                                      "video_detail",
                                      pathParameters: {
                                        "videodetail": videoPost[index].title,
                                      },
                                      extra: videoPost[index],
                                    ),
                                    child: Container(
                                      height: screenSize.width < 800 ? 70 : 80,
                                      width: screenSize.width < 800 ? 270 : 300,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      // margin: const EdgeInsets.symmetric(
                                      //     horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: AppColor.gray.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          videoPost[index].title,
                                          style: style.copyWith(
                                              color: AppColor.white),
                                        ),
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
                            : Positioned(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _controller.animateTo(
                                            _controller
                                                .position.minScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                AppColor.gray.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: AppColor.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      InkWell(
                                        onTap: () {
                                          _controller.animateTo(
                                            _controller
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                AppColor.gray.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                              ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
