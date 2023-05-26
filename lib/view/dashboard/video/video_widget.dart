import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoWidget extends StatelessWidget {
  final List<Posts> videoPost;
  final int bulderRowNum;
  final int length;
  const VideoWidget(
      {super.key,
      required this.videoPost,
      required this.bulderRowNum,
      required this.length});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);
    var postProvider = Provider.of<PostController>(context);
    return Container(
      color: AppColor.primaryColor,
      padding: EdgeInsets.all(screenSize.width / 35),
      child: GridView.builder(
        itemCount: length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenSize.width < 800 ? 1 : bulderRowNum,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 310,
        ),
        itemBuilder: ((context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.white.withOpacity(0.6),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 170,
                  width: screenSize.width, //< 800 ? 220 : 294,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    //borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(videoPost[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height / 10,
                        child: Text(
                          videoPost[index].title,
                          style: style.copyWith(
                            fontSize: 13,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      Divider(
                        color: AppColor.white.withOpacity(0.4),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Uploaded by  ${videoPost[index].posterName}',
                                style: style.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.white.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  StreamBuilder<List<Category>>(
                                    stream: provider.fetchAllVideoCategory(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Container(
                                            color: AppColor.primaryColor);
                                      } else {
                                        var category = snapshot.data!
                                            .where((element) =>
                                                element.id ==
                                                videoPost[index].categoryID)
                                            .toList();
                                        return Text(
                                          category[0].name.toUpperCase(),
                                          style: style.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                AppColor.white.withOpacity(0.5),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '-  30 mins ago',
                                    style: style.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color: AppColor.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          PopupMenuButton(
                            color: AppColor.primaryColor,
                            icon: Icon(
                              Icons.more_vert_outlined,
                              color: AppColor.white.withOpacity(0.5),
                            ),
                            shadowColor: AppColor.white.withOpacity(0.4),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () => postProvider.deletePost(
                                    videoPost[index].id, context),
                                child: Text(
                                  'Delete',
                                  style: style.copyWith(
                                    color: AppColor.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  showPopupMenu(context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 200.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(child: const Text('menu option 1'), value: '1'),
        PopupMenuItem<String>(child: const Text('menu option 2'), value: '2'),
        PopupMenuItem<String>(child: const Text('menu option 3'), value: '3'),
      ],
      elevation: 8.0,
    );
  }
}
