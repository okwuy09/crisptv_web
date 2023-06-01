import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsCardHomeWidget extends StatefulWidget {
  const NewsCardHomeWidget(
      {super.key, required this.sectionTitle, this.newsPost});
  final String sectionTitle;
  final List<Posts>? newsPost;

  @override
  State<NewsCardHomeWidget> createState() => _NewsCardHomeWidgetState();
}

class _NewsCardHomeWidgetState extends State<NewsCardHomeWidget> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.width < 800 ? 350 : 370,
      //padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.sectionTitle,
          style: style.copyWith(
            fontSize: 18,
            color: AppColor.white,
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                controller: _controller,
                itemCount:
                    widget.newsPost!.length > 6 ? 6 : widget.newsPost!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var news = widget.newsPost![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => context.pushNamed(
                          "news_detail",
                          pathParameters: {
                            "newsdetail": news.title,
                          },
                          extra: news,
                        ),
                        child: Container(
                          height: screenSize.width < 800 ? 220 : 230,
                          width: screenSize.width < 800 ? 250 : 294,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(news.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        width: screenSize.width < 800 ? 230 : 294,
                        height: 70,
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                news.title,
                                style: style.copyWith(
                                  fontSize: 14,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () => context.pushNamed(
                                "news_detail",
                                pathParameters: {
                                  "newsdetail": news.title,
                                },
                                extra: news,
                              ),
                              child: Text(
                                'READ MORE',
                                style: style.copyWith(
                                  color: AppColor.blue,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              screenSize.width < 800
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: InkWell(
                          onTap: () {
                            _controller.animateTo(
                              _controller.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColor.gray.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ]),
    );
  }
}
