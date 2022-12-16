import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import '../post_detail.dart';

class ShowNewsContainer extends StatefulWidget {
  const ShowNewsContainer(
      {super.key, required this.sectionTitle, required this.imageUrl});
  final String sectionTitle;
  final String imageUrl;

  @override
  State<ShowNewsContainer> createState() => _ShowNewsContainerState();
}

class _ShowNewsContainerState extends State<ShowNewsContainer> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.sectionTitle,
          style: style.copyWith(
            fontSize: 18,
            color: AppColor.white,
          ),
        ),
        SizedBox(height: screenSize.height / 20),
        SizedBox(
          height: screenSize.width < 800 ? null : 280,
          child: Stack(
            children: [
              ListView.builder(
                controller: _controller,
                itemCount: 5,
                scrollDirection:
                    screenSize.width < 800 ? Axis.vertical : Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: screenSize.width < 800
                        ? const EdgeInsets.only(bottom: 30)
                        : const EdgeInsets.only(bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 180,
                          width:
                              screenSize.width < 800 ? screenSize.width : 284,
                          margin: screenSize.width < 800
                              ? null
                              : const EdgeInsets.only(right: 10),
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
                          width:
                              screenSize.width < 800 ? screenSize.width : 284,
                          height: 80,
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
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
