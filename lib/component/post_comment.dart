import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/constant.dart';
import 'package:crisptv_media/service/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostComment extends StatefulWidget {
  final String postId;
  const PostComment({super.key, required this.postId});

  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  final TextEditingController _comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<PostController>(context);
    return Container(
      height: 180,
      width: screenSize.width,
      color: AppColor.primaryColor,
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        TextFormField(
          style: style.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColor.white.withOpacity(0.8),
          ),
          cursorColor: AppColor.white,
          controller: _comment,
          decoration: InputDecoration(
            //fillColor: AppColor.lightGray.withOpacity(0.5),
            filled: true,
            hintText: 'What are your thoughts?',
            hintStyle: style.copyWith(
              color: AppColor.white.withOpacity(0.3),
              fontSize: 14,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: AppColor.lightGray,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: AppColor.lightGray),
            ),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () async => await provider
              .postComment(
                  context: context,
                  userName: 'Okwuchukwu',
                  userImage: '',
                  writeUp: _comment.text,
                  postID: widget.postId)
              .then((value) => _comment.clear()),
          child: Container(
            height: 50,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: AppColor.lightGray.withOpacity(0.6),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: provider.ispostingComment
                  ? buttonCircularIndicator
                  : Text(
                      'PUBLISH COMMENT',
                      style: style.copyWith(
                        color: AppColor.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
            ),
          ),
        )
      ]),
    );
  }
}
