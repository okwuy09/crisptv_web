import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/widget/news/news.dart';
import 'package:flutter/material.dart';
import '../../component/newspage_container.dart';
import '../../component/style.dart';
import '../buttom_bar.dart';
import '../post_detail.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: screenSize.width / 15,
            right: screenSize.width / 20,
            left: screenSize.width / 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Business',
                style: style.copyWith(
                  color: AppColor.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: screenSize.height / 10),
              screenSize.width < 800
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: screenSize.width < 800 ? 400 : 547,
                              width: screenSize.width < 800
                                  ? screenSize.width
                                  : 654,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/ps3.png'),
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
                                    builder: (_) => const PostDetail(),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Game-Changing Lawsuit Takes on TikTok - A win would mean justice for Blackout Challenge....',
                                      style: style.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'By Blessing Christopher  |  50 Mins read',
                                      style: style.copyWith(
                                        fontSize: 14,
                                        color: AppColor.white.withOpacity(0.6),
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
                              height: screenSize.width < 800 ? 200 : 232,
                              width: screenSize.width,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/ps4.png'),
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
                                    builder: (_) => const PostDetail(),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nigerian leaders have failed to remain faithful to democratic vision, Jinadu',
                                      style: style.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'By Blessing Christopher  |  50 Mins read',
                                      style: style.copyWith(
                                        fontSize: 14,
                                        color: AppColor.white.withOpacity(0.6),
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
                              height: screenSize.width < 800 ? 200 : 232,
                              width: screenSize.width,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/news.jpg'),
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
                                    builder: (_) => const PostDetail(),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '19.6% inflation: More people become poor, experts warn',
                                      style: style.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'By Blessing Christopher  |  50 Mins read',
                                      style: style.copyWith(
                                        fontSize: 14,
                                        color: AppColor.white.withOpacity(0.6),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: screenSize.width < 800 ? 300 : 547,
                                width: screenSize.width < 800
                                    ? screenSize.width
                                    : 654,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/ps3.png'),
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
                                      builder: (_) => const PostDetail(),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Game-Changing Lawsuit Takes on TikTok - A win would mean justice for Blackout Challenge....',
                                        style: style.copyWith(
                                          color: AppColor.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'By Blessing Christopher  |  50 Mins read',
                                        style: style.copyWith(
                                          fontSize: 14,
                                          color:
                                              AppColor.white.withOpacity(0.6),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: screenSize.width < 800 ? 300 : 232,
                                    // width: screenSize.width < 800
                                    //     ? screenSize.width
                                    //     : 511,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/ps4.png'),
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
                                          builder: (_) => const PostDetail(),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nigerian leaders have failed to remain faithful to democratic vision, Jinadu',
                                            style: style.copyWith(
                                              color: AppColor.white,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'By Blessing Christopher  |  50 Mins read',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: screenSize.width < 800 ? 300 : 232,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/news.jpg'),
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
                                          builder: (_) => const PostDetail(),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '19.6% inflation: More people become poor, experts warn',
                                            style: style.copyWith(
                                              color: AppColor.white,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'By Blessing Christopher  |  50 Mins read',
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
              SizedBox(height: screenSize.height / 6),
              // gride post display for pc and mobile devices

              screenSize.width < 800
                  ? ListView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 320,
                                  width: screenSize.width, // < 800 ? 220 : 294,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    //borderRadius: BorderRadius.circular(6),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/ps4.png'),
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
                                        builder: (_) => const PostDetail(),
                                      ),
                                    ),
                                    child: Container(
                                      width:
                                          screenSize.width, //< 800 ? 220 : 295,
                                      // height: screenSize.width < 800 ? 85 : 72,
                                      color: AppColor.gray.withOpacity(0.95),
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '19.6% inflation: More people become poor, experts warn',
                                            style: style.copyWith(
                                              fontSize: 14,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'By Blessing Christopher  |  50 Mins read',
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
                      itemCount: 12,
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
                                image: const DecorationImage(
                                  image: AssetImage('assets/ps4.png'),
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
                                    builder: (_) => const PostDetail(),
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
                                        '19.6% inflation: More people become poor, experts warn',
                                        style: style.copyWith(
                                          fontSize: 14,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'By Blessing Christopher  |  50 Mins read',
                                        style: style.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              AppColor.white.withOpacity(0.6),
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

              SizedBox(height: screenSize.height / 5),
              Container(
                height: screenSize.width < 800 ? 180 : 404,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ads.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 10),
              NewsPageContainer(
                sectionTitle: 'POLITICS NOW',
                imageUrl: 'assets/ps3.png',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsPage(selectedPage: 'Politics now'),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height / 10),
              NewsPageContainer(
                sectionTitle: 'MEDIA',
                imageUrl: 'assets/ps2.png',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsPage(selectedPage: 'Media'),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenSize.height / 5),
        const BottomBar(),
      ],
    );
  }
}
