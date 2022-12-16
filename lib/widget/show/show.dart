import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/buttom_bar.dart';
import 'package:crisptv_media/widget/show/show_news.dart';
import 'package:crisptv_media/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../post_detail.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({super.key});

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  final int _numPages = 10;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  List<Widget> rowElements = [];
  List<String> items = [
    'Popular',
    'Insights',
    'Conto',
    'Roundtable',
    'Streetspur',
    'Business Discovery',
    'Gamechangers',
    'Podcasts',
    'Mind over matters'
  ];
  final List _isclicked = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  var selectedPage = "Popular";

  bool onclicked = true;
  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = GestureDetector(
        onTap: () {
          setState(() {
            _isclicked.replaceRange(0, _isclicked.length,
                [for (int i = 0; i < _isclicked.length; i++) false]);
            _isclicked[i] = true;
            selectedPage = items[i];
          });
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: _isclicked[i]
                  ? AppColor.white.withOpacity(0.4)
                  : AppColor.primaryColor,
            ),
          ),
          child: Center(
            child: Text(
              items[i],
              style: style.copyWith(
                fontSize: 15,
                color: _isclicked[i]
                    ? AppColor.white.withOpacity(0.9)
                    : AppColor.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
      );
      rowElements.add(elementTile);
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    /// generated new pages to navigate through
    var pages = List.generate(
      _numPages,
      (index) => Builder(
        builder: (context) {
          selectedPages() {
            switch (selectedPage) {
              case "Popular":
                return 16;

              case "Insights":
                return 14;

              case "Conto":
                return 12;

              case "Roundtable":
                return 10;
              case "Streetspur":
                return 8;

              case "Business Discovery":
                return 7;
              case "Gamechangers":
                return 6;

              case "Podcasts":
                return 5;
              case "Mind over matters":
                return 4;

              default:
                break;
            }
          }

          return screenSize.width < 800
              ? ListView.builder(
                  itemCount: selectedPages(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 320,
                              width: screenSize.width, // < 800 ? 220 : 294,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                //borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/street.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const PostDetail(),
                                  ),
                                ),
                                child: Container(
                                  width: screenSize.width, //< 800 ? 220 : 295,
                                  height: screenSize.width < 800 ? 85 : 72,
                                  color: AppColor.gray.withOpacity(0.95),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Why you should put your business i...',
                                        style: style.copyWith(
                                          fontSize: 14,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'CONTO ALLA ROVESCIA | 09.08.2022',
                                        style: style.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              AppColor.white.withOpacity(0.6),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20)
                      ],
                    );
                  }),
                )
              : GridView.builder(
                  itemCount: selectedPages(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenSize.width < 800 ? 3 : 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: ((context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 300,
                          width: screenSize.width < 800 ? 220 : 294,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            //borderRadius: BorderRadius.circular(6),
                            image: const DecorationImage(
                              image: AssetImage('assets/street.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PostDetail(),
                              ),
                            ),
                            child: Container(
                              width: screenSize.width < 800 ? 220 : 295,
                              height: screenSize.width < 800 ? 85 : 72,
                              color: AppColor.gray.withOpacity(0.95),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Why you should put your business i...',
                                    style: style.copyWith(
                                      fontSize: 14,
                                      color: AppColor.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'CONTO ALLA ROVESCIA | 09.08.2022',
                                    style: style.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: AppColor.white.withOpacity(0.6),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                );
        },
      ),
    );
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 1,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 70),
          child: Stack(
            children: [
              Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      color: AppColor.white.withOpacity(0.5),
                      height: 0,
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: generateRowElements(),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Divider(
                      color: AppColor.white.withOpacity(0.5),
                      height: 0,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: screenSize.width / 20,
                top: 15,
                child: IconButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.white.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
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
                      'Watch & Stream hundreds of educating, inspiring and entertaining videos.',
                      style: style.copyWith(
                        color: AppColor.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: screenSize.height / 10),
                    // new pages
                    //selectedPages(),
                    pages[_currentPage],
                    SizedBox(height: screenSize.height / 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width / 20),
                      child: NumberPaginator(
                        numberPages: _numPages,
                        onPageChange: (int index) {
                          setState(() {
                            _currentPage =
                                index; // _currentPage is a variable within State of StatefulWidget
                          });
                        },
                        config: NumberPaginatorUIConfig(
                          // default height is 48
                          height: 48,
                          buttonShape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),

                          buttonSelectedForegroundColor: AppColor.white,
                          buttonUnselectedForegroundColor:
                              AppColor.white.withOpacity(0.3),
                          buttonUnselectedBackgroundColor:
                              AppColor.gray.withOpacity(0.5),
                          buttonSelectedBackgroundColor:
                              AppColor.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height / 15),
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
                    SizedBox(height: screenSize.height / 15),
                    const ShowNewsContainer(
                      sectionTitle: 'LATEST NEWS AND UPDATES',
                      imageUrl: 'assets/ps3.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height / 5),
              const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
