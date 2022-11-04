import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import '../widget/post_detail.dart';

class NewsPageContainer extends StatefulWidget {
  const NewsPageContainer(
      {super.key,
      required this.sectionTitle,
      required this.imageUrl,
      this.onTap});
  final String sectionTitle;
  final String imageUrl;
  final Function()? onTap;

  @override
  State<NewsPageContainer> createState() => _NewsPageContainerState();
}

class _NewsPageContainerState extends State<NewsPageContainer> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                widget.sectionTitle,
                style: style.copyWith(
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: 40,
                  width: 93,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'View more',
                      style: style.copyWith(
                        color: AppColor.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: screenSize.height / 20),
          SizedBox(
            height: screenSize.width < 800 ? null : 280,
            child: ListView.builder(
              controller: _controller,
              itemCount: 4,
              scrollDirection:
                  screenSize.width < 800 ? Axis.vertical : Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: screenSize.width < 800
                      ? const EdgeInsets.only(bottom: 30)
                      : const EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 180,
                        width: screenSize.width < 800 ? screenSize.width : 284,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: AssetImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //
                      Container(
                        width: screenSize.width < 800 ? screenSize.width : 284,
                        height: 72,
                        padding: const EdgeInsets.only(top: 15),
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
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PostDetail(),
                                ),
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
                  ),
                );
              },
            ),
          ),
        ]);
  }
}
