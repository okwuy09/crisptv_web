import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/news/business.dart';
import 'package:crisptv_media/widget/news/career_hack.dart';
import 'package:crisptv_media/widget/news/media.dart';
import 'package:crisptv_media/widget/news/politic_now.dart';
import 'package:crisptv_media/widget/news/tech.dart';
import 'package:crisptv_media/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'trending.dart';

class NewsPage extends StatefulWidget {
  NewsPage({super.key, this.selectedPage = 'Trending'});
  String selectedPage;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollController = ScrollController();

  List<Widget> rowElements = [];
  List<String> items = [
    'Trending',
    'Politics now',
    'Tech',
    'Business',
    'Media',
    'Career/Life hacks',
  ];
  // final List _isclicked = [
  //   true,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  // ];

  //var selectedPage = "Trending";

  bool onclicked = true;
  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = GestureDetector(
        onTap: () {
          setState(() {
            // _isclicked.replaceRange(0, _isclicked.length,
            //     [for (int i = 0; i < _isclicked.length; i++) false]);
            // _isclicked[i] = true;
            widget.selectedPage = items[i];
          });
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.selectedPage == items[i] //_isclicked[i]
                  ? AppColor.white.withOpacity(0.5)
                  : AppColor.primaryColor,
            ),
          ),
          child: Center(
            child: Text(
              items[i],
              style: style.copyWith(
                fontSize: 15,
                color: widget.selectedPage == items[i] //_isclicked[i]
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

  selectedPages() {
    switch (widget.selectedPage) {
      case "Trending":
        return const TreandingNews();

      case "Politics now":
        return const PoliticsNow();

      case "Tech":
        return const Technology();

      case "Business":
        return const Business();
      case "Media":
        return const Media();

      case "Career/Life hacks":
        return const CareerLifeHacks();

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 2,
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
        body: SingleChildScrollView(child: selectedPages()),
      ),
    );
  }
}
