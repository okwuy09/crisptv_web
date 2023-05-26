import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/model/posts.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:crisptv_media/view/news/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../component/newspage_container.dart';
import '../../component/style.dart';
import '../post_detail.dart';

class TreandingNews extends StatefulWidget {
  const TreandingNews({super.key});

  @override
  State<TreandingNews> createState() => _TreandingNewsState();
}

class _TreandingNewsState extends State<TreandingNews> {
  late Stream<List<Category>> _category;
  late Stream<List<Posts>> _post;
  @override
  void initState() {
    super.initState();

    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllNewsCategory();
    _post = Provider.of<PostController>(context, listen: false)
        .fetchAllPost('news');
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var provider = Provider.of<CategoryController>(context);
    // var postProvider = Provider.of<PostController>(context);
    return StreamBuilder<List<Category>>(
        stream: _category,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var newsCategory = snapshot.data!;
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
                    'Discover stories, articles, and expertise from writers on relevant topics.',
                    style: style.copyWith(
                      color: AppColor.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  // fetching all the New post from firebase
                  StreamBuilder<List<Posts>>(
                      stream: _post,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          var newsPost = snapshot.data!
                              .where((element) => element.postType == 'news')
                              .toList();
                          return screenSize.width < 800
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: screenSize.width < 800
                                              ? 400
                                              : 547,
                                          width: screenSize.width < 800
                                              ? screenSize.width
                                              : 654,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  newsPost[0].image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: screenSize.width < 800
                                              ? screenSize.width
                                              : 654,
                                          child: InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => PostDetail(
                                                    newsPost: newsPost[0]),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  newsPost[0].title,
                                                  style: style.copyWith(
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'By ${newsPost[0].posterName}  |  50 Mins read',
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: screenSize.width < 800
                                              ? 200
                                              : 232,
                                          width: screenSize.width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  newsPost[1].image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: screenSize.width,
                                          child: InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => PostDetail(
                                                    newsPost: newsPost[1]),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  newsPost[1].title,
                                                  style: style.copyWith(
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'By ${newsPost[1].posterName}  |  50 Mins read',
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: screenSize.width < 800
                                              ? 200
                                              : 232,
                                          width: screenSize.width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  newsPost[2].image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: screenSize.width,
                                          child: InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => PostDetail(
                                                    newsPost: newsPost[2]),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  newsPost[2].title,
                                                  style: style.copyWith(
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'By ${newsPost[2].posterName}  |  50 Mins read',
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => PostDetail(
                                                    newsPost: newsPost[0]),
                                              ),
                                            ),
                                            child: Container(
                                              height: screenSize.width < 800
                                                  ? 300
                                                  : 547,
                                              width: screenSize.width < 800
                                                  ? screenSize.width
                                                  : 654,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      newsPost[0].image),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: screenSize.width < 800
                                                ? screenSize.width
                                                : 654,
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => PostDetail(
                                                      newsPost: newsPost[0]),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    newsPost[0].title,
                                                    style: style.copyWith(
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'By ${newsPost[0].posterName}  |  50 Mins read',
                                                    style: style.copyWith(
                                                      fontSize: 14,
                                                      color: AppColor.white
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) => PostDetail(
                                                        newsPost: newsPost[1]),
                                                  ),
                                                ),
                                                child: Container(
                                                  height: screenSize.width < 800
                                                      ? 300
                                                      : 232,
                                                  // width: screenSize.width < 800
                                                  //     ? screenSize.width
                                                  //     : 511,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          newsPost[1].image),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                // width: screenSize.width < 800
                                                //     ? screenSize.width
                                                //     : 654,
                                                child: InkWell(
                                                  onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          PostDetail(
                                                              newsPost:
                                                                  newsPost[1]),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        newsPost[1].title,
                                                        style: style.copyWith(
                                                          color: AppColor.white,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Text(
                                                        'By ${newsPost[1].posterName}  |  50 Mins read',
                                                        style: style.copyWith(
                                                          fontSize: 14,
                                                          color: AppColor.white
                                                              .withOpacity(0.6),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 30),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) => PostDetail(
                                                        newsPost: newsPost[2]),
                                                  ),
                                                ),
                                                child: Container(
                                                  height: screenSize.width < 800
                                                      ? 300
                                                      : 232,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          newsPost[2].image),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                child: InkWell(
                                                  onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          PostDetail(
                                                              newsPost:
                                                                  newsPost[2]),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        newsPost[2].title,
                                                        style: style.copyWith(
                                                          color: AppColor.white,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Text(
                                                        'By ${newsPost[2].posterName}  |  50 Mins read',
                                                        style: style.copyWith(
                                                          fontSize: 14,
                                                          color: AppColor.white
                                                              .withOpacity(0.6),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                        }
                      }),
                  const SizedBox(height: 20),
                  NewsPageContainer(
                    newsCategory: newsCategory[2],
                    sectionTitle: newsCategory[2].name.toUpperCase(),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsPage(selectedPage: newsCategory[2]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: screenSize.width < 800 ? 180 : 404,
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ads1.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NewsPageContainer(
                    sectionTitle: newsCategory[0].name.toUpperCase(),
                    newsCategory: newsCategory[0],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsPage(selectedPage: newsCategory[0]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NewsPageContainer(
                    newsCategory: newsCategory[1],
                    sectionTitle: newsCategory[1].name.toUpperCase(),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsPage(selectedPage: newsCategory[1]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: screenSize.width < 800 ? 180 : 404,
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ads2.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NewsPageContainer(
                    newsCategory: newsCategory[3],
                    sectionTitle: newsCategory[3].name.toUpperCase(),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsPage(selectedPage: newsCategory[3]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  NewsPageContainer(
                    newsCategory: newsCategory[2],
                    sectionTitle: newsCategory[2].name.toUpperCase(),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsPage(selectedPage: newsCategory[2]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
