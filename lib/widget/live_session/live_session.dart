import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/buttom_bar.dart';
import 'package:crisptv_media/widget/show/show_news.dart';
import 'package:crisptv_media/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../component/episodes_temp.dart';
import '../post_detail.dart';

class LiveSessions extends StatefulWidget {
  const LiveSessions({super.key});

  @override
  State<LiveSessions> createState() => _LiveSessionsState();
}

class _LiveSessionsState extends State<LiveSessions> {
  final int _numPages = 10;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    /// generated new pages to navigate through

    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.width / 15,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Powerful, Inspirational and Educative Live Sessions',
                    style: style.copyWith(
                      color: AppColor.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: screenSize.height / 20),
                  Stack(
                    children: [
                      Container(
                        height: screenSize.width < 800 ? 350 : 519,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          color: AppColor.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 47,
                          width: 129,
                          decoration: const BoxDecoration(
                            color: Color(0xffDC2121),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(27),
                              bottomRight: Radius.circular(16),
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
                  SizedBox(height: screenSize.height / 20),
                  Container(
                    height: 160,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: AppColor.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  SizedBox(height: screenSize.height / 4),
                  const EpisodesWidget(
                    sectionTitle: 'LATEST INSIGHTS EPISODES',
                  ),
                  SizedBox(height: screenSize.height / 10),
                  const ShowNewsContainer(
                    sectionTitle: 'TRENDING NEWS',
                    imageUrl: 'assets/ps3.png',
                  ),
                  SizedBox(height: screenSize.height / 10),
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
