import 'dart:convert';

import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/view/post_detail.dart';
import 'package:crisptv/view/show/video_detail.dart';
import 'package:delta_to_html/delta_to_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SearchPostWidget extends StatelessWidget {
  final Posts post;
  const SearchPostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: InkWell(
        onTap: () => post.postType == 'news'
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetail(newsPost: post),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoDetail(videopost: post),
                ),
              ),
        child: Row(
          children: [
            Container(
              height: size.width < 800 ? 100 : 150,
              width: size.width < 800 ? 140 : 220,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: NetworkImage(post.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            /// post title
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: style.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // ? '${post.writeUp.substring(0, 180)}...'

                  post.postType == 'news'
                      ? HtmlWidget(
                          post.writeUp.length < 175
                              ? DeltaToHTML.encodeJson(jsonDecode(post.writeUp))
                              : '${DeltaToHTML.encodeJson(jsonDecode(post.writeUp)).substring(0, 175)}...',
                          textStyle: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.5),
                          ),
                          onErrorBuilder: (context, element, error) =>
                              Text('$element error: $error'),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
