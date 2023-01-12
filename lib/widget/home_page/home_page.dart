import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/episodes_temp.dart';
import 'package:crisptv_media/component/news_temp.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/buttom_bar.dart';
import 'package:crisptv_media/widget/home_page/section_four_display.dart';
import 'package:crisptv_media/widget/home_page/section_three_display.dart';
import 'package:crisptv_media/widget/home_page/section_two_display.dart';
import 'package:crisptv_media/widget/home_page/section_one.dart';
import 'package:crisptv_media/widget/topbar.dart';
import 'package:flutter/material.dart';

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
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.4)
        : 1;
    return TopBarContents(
      backgroundColor: AppColor.primaryColor.withOpacity(_opacity),
      homeIndex: 0,
      extendBody: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.width < 800 ? 705 : 650,
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
                          const SizedBox(
                            height: 360,
                          ),
                          Text(
                            'WATCH, LEARN & ENJOY',
                            style: style.copyWith(
                              fontSize: 40,
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
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
                                color: AppColor.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 35),
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
                                  duration: const Duration(milliseconds: 500),
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
                                    setState(() {
                                      selected = !selected;
                                    });
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
            Column(
              children: [
                // section One
                const SectionOne(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height / 12),
                      const EpisodesWidget(
                        sectionTitle: 'LATEST INSIGHTS EPISODES',
                      ),
                      SizedBox(height: screenSize.height / 8),
                      const EpisodesWidget(
                        sectionTitle: 'LATEST CONTO EPISODES',
                      ),
                    ],
                  ),
                ),

                // section Two
                SizedBox(height: screenSize.height / 8),
                const SectionTwoDisplay(),
                SizedBox(height: screenSize.height / 8),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                  child: Column(
                    children: [
                      const EpisodesWidget(
                        sectionTitle: 'LATEST STREET SPUR EPISODES',
                      ),
                      SizedBox(height: screenSize.height / 8),
                      const EpisodesWidget(
                        sectionTitle: 'LATEST GAMECHANGERS EPISODES',
                      ),
                    ],
                  ),
                ),

                // section three
                SizedBox(height: screenSize.height / 8),
                const SectionThreeDisplay(),
                SizedBox(height: screenSize.height / 8),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                  child: Column(
                    children: [
                      const EpisodesWidget(
                        sectionTitle: 'LATEST MIND OVER MATTER EPISODES',
                      ),
                      SizedBox(height: screenSize.height / 8),
                      const EpisodesWidget(
                        sectionTitle: 'INSPIRING STORIES',
                      ),
                    ],
                  ),
                ),

                // news session
                SizedBox(height: screenSize.height / 8),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                  child: const NewsCardHomeWidget(
                    sectionTitle: 'LATEST NEWS AND UPDATES',
                  ),
                ),
                SizedBox(height: screenSize.height / 8),
                const SectionFourDisplay(),
                SizedBox(height: screenSize.height / 5),
                const BottomBar()
              ],
            )
          ],
        ),
      ),
    );
  }
}
