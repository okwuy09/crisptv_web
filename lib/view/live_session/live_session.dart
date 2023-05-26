import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/model/category.dart';
import 'package:crisptv_media/service/category_controller.dart';
import 'package:crisptv_media/view/buttom_bar.dart';
import 'package:crisptv_media/view/live_session/youtube_player.dart';
import 'package:crisptv_media/view/show/show_news.dart';
import 'package:crisptv_media/view/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/episodes_temp.dart';

class LiveSessions extends StatefulWidget {
  const LiveSessions({super.key});

  @override
  State<LiveSessions> createState() => _LiveSessionsState();
}

class _LiveSessionsState extends State<LiveSessions> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);

    /// generated new pages to navigate through

    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 3,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Powerful, Inspirational and Educative Live Sessions',
                      style: style.copyWith(
                        color: AppColor.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  Container(
                    //height: screenSize.width < 800 ? 350 : 560,
                    width: screenSize.width,
                    margin: screenSize.width < 800
                        ? null
                        : EdgeInsets.symmetric(
                            horizontal: screenSize.width / 10),
                    decoration: BoxDecoration(
                      color: AppColor.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        const YoutubePlayerWidget(
                          videoURL:
                              'https://www.youtube.com/watch?v=mrB8Jmn38VM',
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: screenSize.width < 800 ? 26 : 35,
                            width: screenSize.width < 800 ? 70 : 80,
                            decoration: const BoxDecoration(
                              color: Color(0xffDC2121),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'LIVE NOW',
                                style: style.copyWith(
                                  fontSize: 14,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  StreamBuilder<List<Category>>(
                      stream: provider.fetchAllVideoCategory(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          return EpisodesWidget(
                            videoCategory: snapshot.data![0],
                            sectionTitle: 'SHOW EPISODES',
                          );
                        }
                      }),
                  const SizedBox(height: 20),
                  const ShowNewsContainer(
                    sectionTitle: 'TRENDING NEWS',
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: screenSize.width < 800 ? 180 : 404,
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ads.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height / 5),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
