import 'package:crisptv/component/color.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/view/news/news.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import '../../component/newspage_container.dart';
import '../../component/style.dart';
import '../post_detail.dart';

class NewsFeedWidget extends StatefulWidget {
  final List<Posts> newspost;
  const NewsFeedWidget({super.key, required this.newspost});

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  final int _numPages = 10;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<CategoryController>(context);
    return StreamBuilder<List<Category>>(
        stream: provider.fetchAllNewsCategory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var category = snapshot.data!;

            return Padding(
              padding: EdgeInsets.only(
                top: screenSize.width / 15,
                right: screenSize.width / 20,
                left: screenSize.width / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.newspost.isEmpty
                      ? Container()
                      : Builder(builder: (context) {
                          var postCategory = category
                              .where((element) =>
                                  element.id == widget.newspost[0].categoryID)
                              .toList();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postCategory[0].name,
                                style: style.copyWith(
                                  color: AppColor.white,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: screenSize.height / 10),
                            ],
                          );
                        }),

                  (widget.newspost.length < 3)
                      ? Container()
                      : screenSize.width < 800
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          screenSize.width < 800 ? 400 : 547,
                                      width: screenSize.width < 800
                                          ? screenSize.width
                                          : 654,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.newspost[0].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: screenSize.width < 800
                                          ? screenSize.width
                                          : 654,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PostDetail(
                                                newsPost: widget.newspost[0]),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.newspost[0].title,
                                              style: style.copyWith(
                                                color: AppColor.white,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'By ${widget.newspost[0].posterName}  |  50 Mins read',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          screenSize.width < 800 ? 200 : 232,
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.newspost[1].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: screenSize.width,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PostDetail(
                                                newsPost: widget.newspost[1]),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.newspost[1].title,
                                              style: style.copyWith(
                                                color: AppColor.white,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'By ${widget.newspost[1].posterName}  |  50 Mins read',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          screenSize.width < 800 ? 200 : 232,
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.newspost[2].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: screenSize.width,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PostDetail(
                                                newsPost: widget.newspost[2]),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.newspost[2].title,
                                              style: style.copyWith(
                                                color: AppColor.white,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'By ${widget.newspost[2].title}  |  50 Mins read',
                                              style: style.copyWith(
                                                fontSize: 14,
                                                color: AppColor.white
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            screenSize.width < 800 ? 300 : 547,
                                        width: screenSize.width < 800
                                            ? screenSize.width
                                            : 654,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                widget.newspost[0].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: screenSize.width < 800
                                            ? screenSize.width
                                            : 654,
                                        child: InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => PostDetail(
                                                  newsPost: widget.newspost[0]),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.newspost[0].title,
                                                style: style.copyWith(
                                                  color: AppColor.white,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'By ${widget.newspost[0].posterName}  |  50 Mins read',
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: screenSize.width < 800
                                                ? 300
                                                : 232,
                                            // width: screenSize.width < 800
                                            //     ? screenSize.width
                                            //     : 511,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    widget.newspost[1].image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            // width: screenSize.width < 800
                                            //     ? screenSize.width
                                            //     : 654,
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => PostDetail(
                                                      newsPost:
                                                          widget.newspost[1]),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.newspost[1].title,
                                                    style: style.copyWith(
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'By ${widget.newspost[1].posterName}  |  50 Mins read',
                                                    style: style.copyWith(
                                                      fontSize: 14,
                                                      color: AppColor.white
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: screenSize.width < 800
                                                ? 300
                                                : 232,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    widget.newspost[2].image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => PostDetail(
                                                      newsPost:
                                                          widget.newspost[2]),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.newspost[2].title,
                                                    style: style.copyWith(
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'By ${widget.newspost[2].posterName}  |  50 Mins read',
                                                    style: style.copyWith(
                                                      fontSize: 14,
                                                      color: AppColor.white
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                  SizedBox(height: screenSize.height / 10),
                  // gride post display for pc and mobile devices

                  screenSize.width < 800
                      ? ListView.builder(
                          itemCount: widget.newspost.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 320,
                                      width: screenSize
                                          .width, // < 800 ? 220 : 294,
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        //borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.newspost[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PostDetail(
                                                newsPost:
                                                    widget.newspost[index]),
                                          ),
                                        ),
                                        child: Container(
                                          width: screenSize
                                              .width, //< 800 ? 220 : 295,
                                          // height: screenSize.width < 800 ? 85 : 72,
                                          color:
                                              AppColor.gray.withOpacity(0.95),
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.newspost[index].title,
                                                style: style.copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.white,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'By ${widget.newspost[index].posterName}  |  50 Mins read',
                                                style: style.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColor.white
                                                      .withOpacity(0.6),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20)
                              ],
                            );
                          }),
                        )
                      : GridView.builder(
                          itemCount: widget.newspost.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: ((context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 300,
                                  width: screenSize.width < 800 ? 220 : 294,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    //borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          widget.newspost[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PostDetail(
                                            newsPost: widget.newspost[index]),
                                      ),
                                    ),
                                    child: Container(
                                      width: screenSize.width < 800 ? 220 : 295,
                                      //height: screenSize.width < 800 ? 85 : 72,
                                      color: AppColor.gray.withOpacity(0.95),
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.newspost[index].title,
                                            style: style.copyWith(
                                              fontSize: 14,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'By ${widget.newspost[index].posterName}  |  50 Mins read',
                                            style: style.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: AppColor.white
                                                  .withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                        ),

                  const SizedBox(height: 50),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                    child: NumberPaginator(
                      numberPages: _numPages,
                      onPageChange: (int index) {
                        setState(() {
                          _currentIndex =
                              index; // _currentPage is a variable within State of StatefulWidget
                        });
                      },
                      config: NumberPaginatorUIConfig(
                        // default height is 48
                        height: 48,
                        buttonShape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),

                        buttonSelectedForegroundColor: AppColor.white,
                        buttonUnselectedForegroundColor:
                            AppColor.white.withOpacity(0.3),
                        buttonUnselectedBackgroundColor:
                            AppColor.gray.withOpacity(0.5),
                        buttonSelectedBackgroundColor:
                            AppColor.white.withOpacity(0.3),
                      ),
                    ),
                  ),

                  widget.newspost.isEmpty
                      ? Container()
                      : SizedBox(height: screenSize.height / 10),
                  Container(
                    height: screenSize.width < 800 ? 180 : 404,
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ads2.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  (widget.newspost.isEmpty)
                      ? Container()
                      : StreamBuilder<List<Category>>(
                          stream: provider.fetchAllNewsCategory(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            } else {
                              var newsCategory = snapshot.data!
                                  .where((element) =>
                                      element.id !=
                                      widget.newspost[0].categoryID)
                                  .toList();

                              return Column(
                                children: [
                                  NewsPageContainer(
                                    newsCategory: newsCategory[0],
                                    sectionTitle:
                                        newsCategory[0].name.toUpperCase(),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NewsPage(
                                            selectedPage: newsCategory[0]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenSize.height / 10),
                                  NewsPageContainer(
                                    newsCategory: newsCategory[1],
                                    sectionTitle:
                                        newsCategory[1].name.toUpperCase(),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NewsPage(
                                            selectedPage: newsCategory[1]),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          })
                ],
              ),
            );
          }
        });
  }
}
