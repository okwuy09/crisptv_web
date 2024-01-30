import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  final ScrollController _controller = ScrollController();
  bool isMaxlength = false;
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
              height: screenSize.width < 800 ? 350 : 400,
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
                    height: screenSize.width < 800 ? 240 : 310,
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
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: AppColor.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(6),
                                                      topRight:
                                                          Radius.circular(6)),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    videoPost[index].image,
                                                fit: BoxFit.fill,
                                                height: screenSize.width < 800
                                                    ? 280
                                                    : 300,
                                                width: screenSize.width < 800
                                                    ? 270
                                                    : 300,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              height: screenSize.width < 800
                                                  ? 70
                                                  : 80,
                                              width: screenSize.width < 800
                                                  ? 270
                                                  : 300,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColor.gray
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(6),
                                                        bottomRight:
                                                            Radius.circular(6)),
                                              ),
                                              child: Text(
                                                videoPost[index].title,
                                                style: style.copyWith(
                                                  fontSize: 14.5,
                                                  color: AppColor.white,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
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
