import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EpisodesWidget extends StatefulWidget {
  const EpisodesWidget({super.key, required this.sectionTitle});
  final String sectionTitle;

  @override
  State<EpisodesWidget> createState() => _EpisodesWidgetState();
}

class _EpisodesWidgetState extends State<EpisodesWidget> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width < 800 ? 300 : 350,
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
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: screenSize.width < 800 ? 220 : 294,
                        margin: const EdgeInsets.only(right: 10),
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
                          onTap: () => context.goNamed(
                            "news_detail",
                            params: {
                              "newsdetail": "Why you should put your business",
                            },
                            extra: 'ok',
                          ),
                          child: Container(
                            width: screenSize.width < 800 ? 220 : 294,
                            height: screenSize.width < 800 ? 85 : 84,
                            color: AppColor.gray.withOpacity(0.95),
                            padding: const EdgeInsets.all(10),
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
