import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/post_comment.dart';
import 'package:crisptv_media/component/view_comment.dart';
import 'package:crisptv_media/widget/news/news.dart';
import 'package:crisptv_media/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../component/style.dart';
//import 'package:share_plus/share_plus.dart';
import '../component/more_news.dart';
import 'buttom_bar.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool viewComment = false;
  bool postComment = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: Column(
                children: [
                  Divider(color: AppColor.white),
                  Padding(
                    padding: EdgeInsets.only(
                      right: screenSize.width < 800
                          ? screenSize.width / 30
                          : screenSize.width / 10,
                      left: screenSize.width < 800
                          ? screenSize.width / 30
                          : screenSize.width / 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenSize.height / 20),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 105,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.white.withOpacity(0.9)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: AppColor.white.withOpacity(0.9),
                                    size: 25,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
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

                        SizedBox(height: screenSize.height / 10),
                        // gride post display for pc and mobile devices

                        Text(
                          'El-Rufai mocks Peter Obi supporters over two million march in Kaduna',
                          style: style.copyWith(
                            fontSize: 30,
                            color: AppColor.white,
                          ),
                        ),

                        const SizedBox(height: 20),
                        Text(
                          'By Blessing Christopher  |  50 Mins read',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: screenSize.height / 10),
                        Container(
                          height: screenSize.width < 800 ? 300 : 450,
                          width: screenSize.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/ps3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        HtmlWidget(
                          '<p> The presidential candidate of the Peoples Democratic Party (PDP) made the donation when he visited the state, among the worst hit since the deadly floods started, on Tuesday. “On my part and on behalf of my family, I wish to announce a donation of 50 million to the fund. It is a national emergency relief fund similar in scope to what was initiated during the COVID-19 pandemic,” <p>Atiku said. He equally appealed to his friends and associates to emulate him in donating to the victims of the flooding. “And to that end, I wish to call on my friends and associates in the corporate world in their private capacity to join me in this cause,” the PDP candidate added. Atiku also promised to ensure such an incident does not reoccur if he is elected in 2023.</p> “If elected as president in the presidential election next year, I shall commit to completing the Dadin Hausa Dam in Adamawa State to manage the releases of excess water in Lagdo Dam in the Cameroon Republic. I shall also commit to working with state governments like Bayelsa to build the required flood management infrastructures,” <p> he pledged. His comment comes as the Federal Government said the floods have affected 3,219,780 persons, with no fewer than 612 killed. It has also displaced 1,427,370 persons and 181,600 houses have been partially damaged, while another 123,807 houses totally damaged, according to the Federal Ministry of Humanitarian Affairs. Also, 176,852 hectares of farmlands are said to have been partially damaged and 392,399 hectares totally damaged.</p> “And to that end, I wish to call on my friends and associates in the corporate world in their private capacity to join me in this cause,” the PDP candidate added. Atiku also promised to ensure such an incident does not reoccur if he is elected in 2023. “If elected as president in the presidential election next year, I shall commit to completing the Dadin Hausa Dam in Adamawa State to manage the releases of excess water in Lagdo Dam in the Cameroon Republic. <p> I shall also commit to working with state governments like Bayelsa to build the required flood management infrastructures,” he pledged. His comment comes as the Federal Government said the floods have affected 3,219,780 persons, with no fewer than 612 killed. It has also displaced 1,427,370 persons and 181,600 houses have been partially damaged, while another 123,807 houses totally damaged, according to the Federal Ministry of Humanitarian Affairs. Also, 176,852 hectares of farmlands are said to have been partially damaged and 392,399 hectares totally damaged.</p> <strong>strong</strong>, <em>emphasized</em>and <span style="color: yellow">colored</span> text.</p><!-- anything goes here -->'
                          '',
                          textStyle: style.copyWith(
                            color: AppColor.white.withOpacity(0.8),
                            wordSpacing: 1.5,
                          ),
                          onErrorBuilder: (context, element, error) =>
                              Text('$element error: $error'),
                        ),

                        // Text(
                        //   'The presidential candidate of the Peoples Democratic Party (PDP) made the donation when he visited the state, among the worst hit since the deadly floods started, on Tuesday. “On my part and on behalf of my family, I wish to announce a donation of 50 million to the fund. It is a national emergency relief fund similar in scope to what was initiated during the COVID-19 pandemic,” Atiku said. He equally appealed to his friends and associates to emulate him in donating to the victims of the flooding. “And to that end, I wish to call on my friends and associates in the corporate world in their private capacity to join me in this cause,” the PDP candidate added. Atiku also promised to ensure such an incident does not reoccur if he is elected in 2023. “If elected as president in the presidential election next year, I shall commit to completing the Dadin Hausa Dam in Adamawa State to manage the releases of excess water in Lagdo Dam in the Cameroon Republic. I shall also commit to working with state governments like Bayelsa to build the required flood management infrastructures,” he pledged. His comment comes as the Federal Government said the floods have affected 3,219,780 persons, with no fewer than 612 killed. It has also displaced 1,427,370 persons and 181,600 houses have been partially damaged, while another 123,807 houses totally damaged, according to the Federal Ministry of Humanitarian Affairs. Also, 176,852 hectares of farmlands are said to have been partially damaged and 392,399 hectares totally damaged. “And to that end, I wish to call on my friends and associates in the corporate world in their private capacity to join me in this cause,” the PDP candidate added. Atiku also promised to ensure such an incident does not reoccur if he is elected in 2023. “If elected as president in the presidential election next year, I shall commit to completing the Dadin Hausa Dam in Adamawa State to manage the releases of excess water in Lagdo Dam in the Cameroon Republic. I shall also commit to working with state governments like Bayelsa to build the required flood management infrastructures,” he pledged. His comment comes as the Federal Government said the floods have affected 3,219,780 persons, with no fewer than 612 killed. It has also displaced 1,427,370 persons and 181,600 houses have been partially damaged, while another 123,807 houses totally damaged, according to the Federal Ministry of Humanitarian Affairs. Also, 176,852 hectares of farmlands are said to have been partially damaged and 392,399 hectares totally damaged.',
                        //   style: style.copyWith(
                        //     color: AppColor.white.withOpacity(0.7),
                        //     wordSpacing: 1.5,
                        //   ),
                        // ),

                        SizedBox(height: screenSize.height / 8),
                        screenSize.width < 900
                            ? Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: screenSize.width,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color:
                                              AppColor.white.withOpacity(0.6),
                                        )),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              '235 Likes',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            Container(
                                              height: 20,
                                              width: 2,
                                              color: AppColor.white
                                                  .withOpacity(0.5),
                                            ),
                                            Expanded(child: Container()),
                                            Icon(
                                              Icons.mode_comment_outlined,
                                              color: AppColor.white
                                                  .withOpacity(0.7),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              '23 Comment',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Divider(
                                            color: AppColor.white
                                                .withOpacity(0.5)),
                                        Expanded(child: Container()),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Share to social',
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              InkWell(
                                                onTap: () async {
                                                  // await Share.shareXFiles([
                                                  //   XFile('assets/hello.txt')
                                                  // ], text: 'Great picture')
                                                  //     .then(
                                                  //   (value) =>
                                                  //       ScaffoldMessenger.of(
                                                  //               context)
                                                  //           .showSnackBar(
                                                  //     SnackBar(
                                                  //       content: Text(
                                                  //           "Share result: ${value.status}"),
                                                  //     ),
                                                  //   ),
                                                  // );
                                                },
                                                child: Icon(
                                                  Icons.share,
                                                  color: AppColor.white
                                                      .withOpacity(0.7),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            viewComment = !viewComment;
                                            postComment = false;
                                          });
                                        },
                                        child: Container(
                                          height: 36,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: AppColor.gray,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'View Comments',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      //const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            postComment = !postComment;
                                            viewComment = false;
                                          });
                                        },
                                        child: Container(
                                          height: 36,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.white
                                                  .withOpacity(0.7),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Comment on this post',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : Container(
                                height: 127,
                                width: screenSize.width,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.white.withOpacity(0.6),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.favorite_border,
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '235 Likes',
                                          style: style.copyWith(
                                            fontSize: 14,
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Icon(
                                          Icons.mode_comment_outlined,
                                          color:
                                              AppColor.white.withOpacity(0.7),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '23 Comment',
                                          style: style.copyWith(
                                            fontSize: 14,
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              viewComment = !viewComment;
                                              postComment = false;
                                            });
                                          },
                                          child: Container(
                                            height: 36,
                                            width: 145,
                                            decoration: BoxDecoration(
                                              color: AppColor.gray,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'View Comments',
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              postComment = !postComment;
                                              viewComment = false;
                                            });
                                          },
                                          child: Container(
                                            height: 36,
                                            width: 183,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Comment on this post',
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Share to social',
                                            style: style.copyWith(
                                              fontSize: 14,
                                              color: AppColor.white
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          InkWell(
                                            onTap: () async {
                                              // await Share.shareXFiles([
                                              //   XFile('assets/hello.txt')
                                              // ], text: 'Great picture')
                                              //     .then(
                                              //   (value) => ScaffoldMessenger.of(
                                              //           context)
                                              //       .showSnackBar(
                                              //     SnackBar(
                                              //       content: Text(
                                              //           "Share result: ${value.status}"),
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                            child: Icon(
                                              Icons.share,
                                              color: AppColor.white
                                                  .withOpacity(0.7),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),

                  ///post comment
                  postComment
                      ? Column(
                          children: [
                            SizedBox(height: screenSize.height / 15),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width < 800
                                        ? screenSize.width / 50
                                        : screenSize.width / 8),
                                child: const PostComment()),
                          ],
                        )
                      : Container(),

                  ///view comment
                  viewComment
                      ? Column(
                          children: [
                            SizedBox(height: screenSize.height / 15),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width < 800
                                        ? screenSize.width / 50
                                        : screenSize.width / 8),
                                child: const ViewComment()),
                          ],
                        )
                      : Container(),

                  SizedBox(height: screenSize.height / 5),
                  MoreNewsContainer(
                    sectionTitle: 'MORE ON POLITICS ',
                    imageUrl: 'assets/ps1.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            NewsPage(selectedPage: 'Career/Life hacks'),
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  MoreNewsContainer(
                    sectionTitle: 'TRENDING NEWS',
                    imageUrl: 'assets/ps4.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsPage(selectedPage: 'Business'),
                      ),
                    ),
                  ),
                  screenSize.width < 800
                      ? InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  NewsPage(selectedPage: 'Trending'),
                            ),
                          ),
                          child: Container(
                            height: 40,
                            width: 183,
                            margin: EdgeInsets.symmetric(
                                vertical: screenSize.height / 30),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.white.withOpacity(0.6)),
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
                      : Container(),
                ],
              ),
            ),
            SizedBox(height: screenSize.height / 5),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
