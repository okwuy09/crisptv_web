import 'package:cached_network_image/cached_network_image.dart';
import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/ads.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/model/slide.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/service/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'delete_category.dart';
import 'upload_ads.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  bool isSlide = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var categoryPro = Provider.of<CategoryController>(context);
    var postPro = Provider.of<PostController>(context);
    var adsProvider = Provider.of<SettingController>(context);
    return Container(
      padding: const EdgeInsets.only(top: 25, right: 10),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        border: Border.all(
          color: AppColor.white.withOpacity(0.5),
        ),
      ),
      child: StreamBuilder<List<Posts>>(
        stream: postPro.fetchAllPost(''),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var video = snapshot.data!
                .where((e) => e.postType.contains('video'))
                .toList();
            var news = snapshot.data!
                .where((e) => e.postType.contains('news'))
                .toList();
            return Column(
              children: [
                Row(
                  children: [
                    StreamBuilder<List<Category>>(
                      stream: categoryPro.fetchAllVideoCategory(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          var videoCat = snapshot.data!;
                          return Expanded(
                            child: CategoryCard(
                              screenSize: screenSize,
                              title: 'Video Category',
                              category: videoCat,
                              categoryType: 'video',
                              posts: video,
                            ),
                          );
                        }
                      },
                    ),
                    StreamBuilder<List<Category>>(
                      stream: categoryPro.fetchAllNewsCategory(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          var newsCat = snapshot.data!;
                          return Expanded(
                            child: CategoryCard(
                              screenSize: screenSize,
                              title: 'News Category',
                              category: newsCat,
                              categoryType: 'news',
                              posts: news,
                            ),
                          );
                        }
                      },
                    ),
                    StreamBuilder<List<Category>>(
                      stream: categoryPro.fetchAllTeamCategory(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          var teamcat = snapshot.data!;
                          return Expanded(
                            child: CategoryCard(
                              screenSize: screenSize,
                              title: 'Team Category',
                              category: teamcat,
                              categoryType: 'team',
                              posts: const [],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),

                /// ads
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: AdsCard(
                        screenSize: screenSize,
                        isSlide: true,
                        imageUrl: '',
                        title: 'Short film slide',
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return const UploadAds(
                              type: 'slide',
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<Ads>(
                          stream: adsProvider.fetchAd1().asStream(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return buttonCircularIndicator;
                            } else {
                              return AdsCard(
                                screenSize: screenSize,
                                isSlide: false,
                                imageUrl: snapshot.data!.imageURL,
                                title: 'Business Ads1',
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const UploadAds(
                                      type: 'ads1',
                                    );
                                  },
                                ),
                              );
                            }
                          }),
                    ),
                    Expanded(
                      child: StreamBuilder<Ads>(
                          stream: adsProvider.fetchAd2().asStream(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return buttonCircularIndicator;
                            } else {
                              return AdsCard(
                                screenSize: screenSize,
                                isSlide: false,
                                imageUrl: snapshot.data!.imageURL,
                                title: 'Session Ads2',
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const UploadAds(
                                      type: 'ads2',
                                    );
                                  },
                                ),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class AdsCard extends StatelessWidget {
  const AdsCard({
    super.key,
    required this.screenSize,
    required this.isSlide,
    required this.onPressed,
    required this.title,
    required this.imageUrl,
  });

  final Size screenSize;
  final bool isSlide;
  final void Function()? onPressed;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            title,
            style: style.copyWith(
              color: AppColor.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Card(
          color: AppColor.gray,
          margin: const EdgeInsets.only(left: 20, right: 5),
          elevation: 0.5,
          child: Container(
            height: screenSize.height / 4.5,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                isSlide
                    ? SizedBox(
                        height: 60,
                        child: StreamBuilder<Slide>(
                            stream: provider.fetchSlide().asStream(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return buttonCircularIndicator;
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data!.imageURL.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              snapshot.data!.imageURL[index],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }),
                      )
                    : Container(
                        height: 60,
                        width: screenSize.width / 4,
                        decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            fit: BoxFit.fitWidth,
                            imageUrl: imageUrl,
                          ),
                        ),
                      ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Text(
                      isSlide ? 'Upload slide' : 'Upload Ads',
                      style: style.copyWith(
                        color: AppColor.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.screenSize,
    required this.title,
    required this.category,
    required this.categoryType,
    required this.posts,
  });

  final Size screenSize;
  final String title;
  final List<Category> category;
  final String categoryType;
  final List<Posts> posts;

  @override
  Widget build(BuildContext context) {
    var categoryPro = Provider.of<CategoryController>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            title,
            style: style.copyWith(
              color: AppColor.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Card(
          color: AppColor.gray,
          margin: const EdgeInsets.only(left: 20, right: 5),
          elevation: 0.5,
          child: Container(
            height: screenSize.height / 3,
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: category.length,
                itemBuilder: (context, index) {
                  var length = posts
                      .where((e) => e.categoryID.contains(category[index].id!))
                      .toList();
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.white.withOpacity(0.15),
                        radius: 17,
                        child: Text(
                          length.length.toString(),
                          style: style.copyWith(
                            fontSize: 9,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      title: Text(
                        category[index].name,
                        style: style.copyWith(
                          color: AppColor.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => DeleteCategory(
                              category: category[index],
                              onTap: () {
                                if (categoryType == 'video') {
                                  categoryPro
                                      .deleteVideoCategory(category[index].id!)
                                      .then(
                                        (value) => Navigator.pop(context),
                                      );
                                } else if (categoryType == 'news') {
                                  categoryPro
                                      .deleteNewsCategory(category[index].id!)
                                      .then(
                                        (value) => Navigator.pop(context),
                                      );
                                } else if (categoryType == 'team') {
                                  categoryPro
                                      .deleteNewsCategory(category[index].id!)
                                      .then(
                                        (value) => Navigator.pop(context),
                                      );
                                } else {}
                              }),
                        ),
                        icon: Icon(
                          Icons.delete,
                          color: AppColor.red,
                        ),
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
