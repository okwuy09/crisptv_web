import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import '../widget/post_detail.dart';

class MoreNewsContainer extends StatefulWidget {
  const MoreNewsContainer(
      {super.key,
      required this.sectionTitle,
      required this.imageUrl,
      this.onTap});
  final String sectionTitle;
  final String imageUrl;
  final Function()? onTap;

  @override
  State<MoreNewsContainer> createState() => _MoreNewsContainerState();
}

class _MoreNewsContainerState extends State<MoreNewsContainer> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      child: screenSize.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  //height: 280,
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 56,
                                width: 56,
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
                              const SizedBox(width: 10),
                              Container(
                                width: screenSize.width / 1.5,
                                height: 56,
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  'How young women can propel their careers can propel their careers',
                                  style: style.copyWith(
                                    fontSize: 14,
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const PostDetail(),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColor.white.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 30,
                            color: AppColor.white.withOpacity(0.6),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          : Column(
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
                    height: 280,
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 180,
                                width: 284,
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
                                width: 284,
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
                  ),
                ]),
    );
  }
}
