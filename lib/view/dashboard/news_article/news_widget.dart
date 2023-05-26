import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatelessWidget {
  final List<Posts> newsPost;
  final int bulderRowNum;
  final int length;
  const NewsWidget(
      {super.key,
      required this.newsPost,
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
          mainAxisExtent: 220,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height / 9,
                        child: Text(
                          newsPost[index].title,
                          style: style.copyWith(
                            fontSize: 13,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Divider(
                        color: AppColor.white.withOpacity(0.4),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Uploaded by  ${newsPost[index].posterName}',
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
                                    stream: provider.fetchAllNewsCategory(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Container(
                                            color: AppColor.primaryColor);
                                      } else {
                                        var category = snapshot.data!
                                            .where((element) =>
                                                element.id ==
                                                newsPost[index].categoryID)
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
                                    newsPost[index].id, context),
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
}
