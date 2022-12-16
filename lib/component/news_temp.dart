import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsCardHomeWidget extends StatefulWidget {
  const NewsCardHomeWidget({super.key, required this.sectionTitle});
  final String sectionTitle;

  @override
  State<NewsCardHomeWidget> createState() => _NewsCardHomeWidgetState();
}

class _NewsCardHomeWidgetState extends State<NewsCardHomeWidget> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height / 1.8,
      //padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.sectionTitle,
          style: style.copyWith(
            fontSize: 18,
            color: AppColor.white,
          ),
        ),
        SizedBox(height: screenSize.height / 20),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                controller: _controller,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: screenSize.width < 800 ? 230 : 284,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/news1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //
                      Container(
                        width: screenSize.width < 800 ? 230 : 284,
                        height: 72,
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How young women can propel their careers can propel their careers',
                              style: style.copyWith(
                                fontSize: 14,
                                color: AppColor.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () => context.goNamed("news_detail",
                                  params: {
                                    "newsdetail":
                                        "How young women can propel their careers can propel their careers"
                                  },
                                  extra: 'ok'),
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
