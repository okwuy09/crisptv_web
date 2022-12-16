import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/custom_dropdown.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/news_article/text_editor.dart';
import 'package:flutter/material.dart';

class NewsArticles extends StatefulWidget {
  const NewsArticles({Key? key}) : super(key: key);

  @override
  State<NewsArticles> createState() => _VideosState();
}

class _VideosState extends State<NewsArticles> {
  String selectedValue = 'ALL';
  List<String> dropDownItem = [
    'ALL',
    'POLITICS NOW',
    'TECH',
    'BUSINESS',
    'MEDIA',
    'CAREER/LIFE HACKS',
  ];

  bool writearticle = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        writearticle
            ? const TextEditor()
            : Column(
                children: [
                  Container(
                    height: 80,
                    width: screenSize.width,
                    margin: const EdgeInsets.only(bottom: 0.3),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      border: Border.all(
                        color: AppColor.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'CATEGORIES:',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 20),
                        CustomDropdown<String>(
                          dropdownColor: AppColor.primaryColor,
                          textColor: AppColor.white.withOpacity(0.6),
                          padding: const EdgeInsets.only(bottom: 3),
                          items: dropDownItem,
                          onChanged: (val) => selectedValue = val,
                          center: true,
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 33,
                            width: 157,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColor.white.withOpacity(0.6),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Create New Category',
                                style: style.copyWith(
                                  fontSize: 13,
                                  color: AppColor.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onTap: () {
                            // context.goNamed(
                            //   "new_article",
                            //   params: {"name": "new_article"},
                            // );
                            setState(() {
                              writearticle = true;
                            });
                          },
                          child: Container(
                            height: 33,
                            width: 110,
                            decoration: BoxDecoration(
                              color: AppColor.lightGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'New Article',
                                style: style.copyWith(
                                  fontSize: 13,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: AppColor.primaryColor,
                      padding: EdgeInsets.all(screenSize.width / 35),
                      child: GridView.builder(
                        itemCount: 12,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenSize.width < 800 ? 1 : 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 220,
                        ),
                        itemBuilder: ((context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.white.withOpacity(0.6),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenSize.height / 9,
                                        child: Text(
                                          'CONFUSED ABOUT NFT: This video explains everything you need to know about NFT and start CASHING OUT',
                                          style: style.copyWith(
                                            fontSize: 13,
                                            color:
                                                AppColor.white.withOpacity(0.8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                      Divider(
                                        color: AppColor.white.withOpacity(0.4),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Uploaded by  David Christopher',
                                                style: style.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColor.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Text(
                                                    'BUSINESS',
                                                    style: style.copyWith(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: AppColor.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    '-  30 mins ago',
                                                    style: style.copyWith(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: AppColor.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.more_vert_outlined,
                                              color: AppColor.white
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
        writearticle
            ? Positioned(
                left: screenSize.width / 20,
                child: InkWell(
                  onTap: (() {
                    setState(() {
                      writearticle = false;
                    });
                  }),
                  child: Container(
                    height: 36,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.lightGray,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          //size: 25,
                          color: AppColor.white.withOpacity(0.6),
                        ),
                        Text(
                          'Back',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
