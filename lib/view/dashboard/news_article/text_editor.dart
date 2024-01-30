import 'dart:convert';

import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/view/dashboard/news_article/publish_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/text.dart' as text;

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final QuillController _controller = QuillController.basic();

  TextEditingController titleController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.primaryColor, //,.withOpacity(0.8),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height / 10,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: _controller,
                  buttonOptions: QuillSimpleToolbarButtonOptions(
                    fontSize: QuillToolbarFontSizeButtonOptions(
                      style: style.copyWith(
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    fontFamily: QuillToolbarFontFamilyButtonOptions(
                      style: style.copyWith(
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    selectHeaderStyleDropdownButton:
                        QuillToolbarSelectHeaderStyleDropdownButtonOptions(
                      textStyle: style.copyWith(
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    var deltaJson =
                        jsonEncode(_controller.document.toDelta().toJson());
                    showDialog(
                      context: context,
                      builder: (_) => PublishArticle(
                        title: titleController.text,
                        writeUp: deltaJson,
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
                    focusNode: focusNode,
                    scrollController: _scrollController,
                    // true for view only mode
                    //embedBuilders: FlutterQuillEmbeds.builders(),

                    configurations: QuillEditorConfigurations(
                      controller: _controller,
                      readOnly: false,
                      scrollable: true,
                      autoFocus: true,
                      expands: true,
                      padding: const EdgeInsets.all(20),
                      customStyles: DefaultStyles(
                        paragraph: DefaultTextBlockStyle(
                          style.copyWith(
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                          // const Tuple2(16, 0),
                        ),
                        h1: DefaultTextBlockStyle(
                          style.copyWith(
                            fontSize: 20,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                        ),
                        h2: DefaultTextBlockStyle(
                          style.copyWith(
                            fontSize: 25,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                        ),
                        h3: DefaultTextBlockStyle(
                          style.copyWith(
                            fontSize: 30,
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                        ),
                        quote: DefaultTextBlockStyle(
                          style.copyWith(
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                        ),
                        lists: DefaultListBlockStyle(
                          style.copyWith(
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                          null,
                        ),
                        code: DefaultTextBlockStyle(
                          style.copyWith(
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                        ),
                        leading: DefaultTextBlockStyle(
                          style.copyWith(
                            color: AppColor.white.withOpacity(0.8),
                          ),
                          const VerticalSpacing(16, 0),
                          const VerticalSpacing(0, 0),
                          null,
                        ),
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
