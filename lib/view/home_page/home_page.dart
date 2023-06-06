import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/episodes_temp.dart';
import 'package:crisptv/component/news_temp.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/buttom_bar.dart';
import 'package:crisptv/view/home_page/section_four_display.dart';
import 'package:crisptv/view/home_page/section_three_display.dart';
import 'package:crisptv/view/home_page/section_two_display.dart';
import 'package:crisptv/view/home_page/section_one.dart';
import 'package:crisptv/view/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  bool selected = false;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          selected = !selected;
        }));
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryController>(context);
    var provider = Provider.of<PostController>(context);
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.4)
        : 1;
    return TopBarContents(
      backgroundColor: AppColor.primaryColor.withOpacity(_opacity),
      homeIndex: 0,
      extendBody: true,
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        radius: const Radius.circular(5),
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.width < 800 ? screenSize.height : 650,
                width: screenSize.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/homevideo.gif',
                      fit: BoxFit.cover,
                    ),
                    ClipRRect(
                      // Clip it cleanly.
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColor.primaryColor.withOpacity(0.4),
                              AppColor.primaryColor.withOpacity(0.4),
                              AppColor.primaryColor,
                              AppColor.primaryColor,
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Expanded(child: Container()),
                            Text(
                              'WATCH, LEARN & ENJOY',
                              style: style.copyWith(
                                fontSize: 40,
                                color: AppColor.white.withOpacity(0.8),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            //const SizedBox(height: 10),
                            Container(
                              width: screenSize.width < 800
                                  ? screenSize.width / 1.1
                                  : screenSize.width / 3,
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'Watch inspiring and educating contents, documentaries, with loads of informational and educating articles',
                                style: style.copyWith(
                                  fontSize: 15,
                                  color: AppColor.white.withOpacity(0.6),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () => _scrollController.animateTo(
                                screenSize.height,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn,
                              ),
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.ondemand_video_outlined,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'START WATCHING',
                                      style: style.copyWith(
                                        color: AppColor.primaryColor,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            screenSize.width < 800
                                ? AnimatedContainer(
                                    alignment: Alignment.center,
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.decelerate,
                                    margin: const EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    height: selected ? 30 : 0,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Icon(
                                      Icons.keyboard_double_arrow_up_outlined,
                                      size: selected ? 40 : 20,
                                      color: AppColor.white.withOpacity(0.6),
                                    ),
                                    onEnd: () {
                                      setState(
                                        () {
                                          selected = !selected;
                                        },
                                      );
                                    },
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<Category>>(
                stream: categoryProvider.fetchAllVideoCategory(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    var videoCategory = snapshot.data!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // section One
                        const SectionOne(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              EpisodesWidget(
                                videoCategory: videoCategory[0],
                                sectionTitle:
                                    'LATEST ${videoCategory[0].name.toUpperCase()} EPISODES',
                              ),
                              const SizedBox(height: 20),
                              EpisodesWidget(
                                videoCategory: videoCategory[1],
                                sectionTitle:
                                    'LATEST ${videoCategory[1].name.toUpperCase()} EPISODES',
                              ),
                            ],
                          ),
                        ),

                        // section Two
                        const SizedBox(height: 20),
                        const SectionTwoDisplay(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              EpisodesWidget(
                                videoCategory: videoCategory[2],
                                sectionTitle:
                                    'LATEST ${videoCategory[2].name.toUpperCase()} EPISODES',
                              ),
                              const SizedBox(height: 20),
                              EpisodesWidget(
                                videoCategory: videoCategory[3],
                                sectionTitle:
                                    'LATEST ${videoCategory[3].name.toUpperCase()} EPISODES',
                              ),
                            ],
                          ),
                        ),

                        // section three
                        const SizedBox(height: 20),
                        const SectionThreeDisplay(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              EpisodesWidget(
                                videoCategory: videoCategory[4],
                                sectionTitle:
                                    'LATEST ${videoCategory[4].name.toUpperCase()} EPISODES',
                              ),
                              const SizedBox(height: 20),
                              EpisodesWidget(
                                videoCategory: videoCategory[5],
                                sectionTitle:
                                    videoCategory[5].name.toUpperCase(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              // news session
              const SizedBox(height: 20),
              StreamBuilder<List<Posts>>(
                stream: provider.fetchAllPost('news'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    var newsPost = snapshot.data!
                        .where((element) => element.postType == 'news')
                        .toList();
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width / 20),
                      child: NewsCardHomeWidget(
                        newsPost: newsPost,
                        sectionTitle: 'LATEST NEWS AND UPDATES',
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: screenSize.height / 14),
              const SectionFourDisplay(),
              SizedBox(height: screenSize.height / 5),
              const BottomBar()
            ],
          ),
        ),
      ),
    );
  }
}
