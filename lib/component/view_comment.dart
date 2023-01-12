import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

class ViewComment extends StatefulWidget {
  const ViewComment({super.key});

  @override
  State<ViewComment> createState() => _ViewCommentState();
}

class _ViewCommentState extends State<ViewComment> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: screenSize.height * 1,
          width: screenSize.width,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Container(
                  width: screenSize.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.white,
                          backgroundImage: const AssetImage('assets/news1.jpg'),
                        ),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nweke Franklin',
                              style: style.copyWith(
                                  color: AppColor.white.withOpacity(0.8)),
                            ),
                            Text(
                              '2 days ago',
                              style: style.copyWith(
                                color: AppColor.white.withOpacity(0.4),
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz_rounded,
                            color: AppColor.white.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Messages is a simple, helpful messaging app that keeps you connected with the people who matter most. Text anyone from anywhere across devices.  Messages is a simple, helpful messaging app that keeps you connected with the people who matter most. Text anyone from anywhere across devices.',
                      style: style.copyWith(
                        color: AppColor.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: screenSize.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: AppColor.white.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_outline_rounded,
                              color: AppColor.white.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            '12 Likes',
                            style: style.copyWith(
                              fontSize: 12,
                              color: AppColor.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mode_comment_outlined,
                              color: AppColor.white.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            '2 Replies',
                            style: style.copyWith(
                              fontSize: 12,
                              color: AppColor.white.withOpacity(0.8),
                            ),
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Reply',
                              style: style.copyWith(
                                fontSize: 14,
                                color: AppColor.white.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                );
              })),
        ),
      ],
    );
  }
}
