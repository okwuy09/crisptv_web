import 'dart:convert';

import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/view/dashboard/news_article/edit_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:tuple/tuple.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/text.dart' as text;

class EditPost extends StatefulWidget {
  final Posts post;
  const EditPost({super.key, required this.post});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  QuillController? _controller;

  TextEditingController? titleController;
  final ScrollController _scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = QuillController(
      document: Document.fromJson(jsonDecode(widget.post.writeUp)),
      selection: const TextSelection.collapsed(offset: 0),
    );
    titleController = TextEditingController(text: widget.post.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height / 20,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.white.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColor.white.withOpacity(0.9),
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            text.Text(
                              'Go Back',
                              style: style.copyWith(
                                color: AppColor.white.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 20,
                  ),
                  QuillToolbar.basic(
                    controller: _controller!,
                    //embedButtons: FlutterQuillEmbeds.buttons(),
                    iconTheme: QuillIconTheme(
                      iconUnselectedColor: AppColor.white.withOpacity(0.5),
                      iconSelectedColor: AppColor.white,
                      iconSelectedFillColor: AppColor.white.withOpacity(0.15),
                      iconUnselectedFillColor: AppColor.white.withOpacity(0.08),
                      disabledIconColor: AppColor.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    var deltaJson =
                        jsonEncode(_controller!.document.toDelta().toJson());
                    showDialog(
                      context: context,
                      builder: (_) => EditArticle(
                        title: titleController!.text,
                        writeUp: deltaJson,
                        post: widget.post,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.only(
                      top: screenSize.height / 20,
                      right: screenSize.width / 20,
                      left: screenSize.width / 20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.lightGray,
                        )),
                    child: text.Text(
                      'Publish Article',
                      style: style.copyWith(
                        fontSize: 13,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height / 50,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: TextFormField(
                controller: titleController,
                style: style.copyWith(
                  fontSize: 25,
                  color: AppColor.white.withOpacity(0.8),
                ),
                decoration: InputDecoration(
                  hintText: 'Enter the title of your article here',
                  hintStyle: style.copyWith(
                    fontSize: 25,
                    color: AppColor.white.withOpacity(0.2),
                    letterSpacing: 1.5,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.white.withOpacity(0.4),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.white.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height / 20,
                  right: screenSize.width / 20,
                  left: screenSize.width / 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.white.withOpacity(0.3),
                    ),
                  ),
                  child: QuillEditor(
                    scrollable: true,
                    autoFocus: true,
                    expands: true,
                    padding: const EdgeInsets.all(20),
                    focusNode: focusNode,
                    scrollController: _scrollController,
                    controller: _controller!,
                    readOnly: false, // true for view only mode
                    //embedBuilders: FlutterQuillEmbeds.builders(),
                    customStyles: DefaultStyles(
                      paragraph: DefaultTextBlockStyle(
                        style.copyWith(
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                        // const Tuple2(16, 0),
                        // const Tuple2(0, 0),
                        // null,
                      ),
                      h1: DefaultTextBlockStyle(
                        style.copyWith(
                          fontSize: 20,
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                      ),
                      h2: DefaultTextBlockStyle(
                        style.copyWith(
                          fontSize: 25,
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                      ),
                      h3: DefaultTextBlockStyle(
                        style.copyWith(
                          fontSize: 30,
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                      ),
                      quote: DefaultTextBlockStyle(
                        style.copyWith(
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                      ),
                      lists: DefaultListBlockStyle(
                        style.copyWith(
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                        null,
                      ),
                      code: DefaultTextBlockStyle(
                        style.copyWith(
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                      ),
                      leading: DefaultTextBlockStyle(
                        style.copyWith(
                          color: AppColor.white.withOpacity(0.8),
                        ),
                        const Tuple2(16, 0),
                        const Tuple2(0, 0),
                        null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
