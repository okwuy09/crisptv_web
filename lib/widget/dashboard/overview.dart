import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
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
                  children: [
                    Text(
                      'RECENTLY UPLOADED VIDEOS',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 33,
                        width: 93,
                        decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'View More',
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
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenSize.width < 800 ? 1 : 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 310,
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
                            Container(
                              height: 170,
                              width: screenSize.width, //< 800 ? 220 : 294,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                //borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/ps1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenSize.height / 10,
                                    child: Text(
                                      'CONFUSED ABOUT NFT: This video explains everything you need to know about NFT and start CASHING OUT',
                                      style: style.copyWith(
                                        fontSize: 13,
                                        color: AppColor.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
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
                                                'INSIGHTS',
                                                style: style.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColor.blue,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                '-  30 mins ago',
                                                style: style.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.normal,
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
                                          color:
                                              AppColor.white.withOpacity(0.5),
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
        ),
        //

        Expanded(
          child: Column(
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
                    color: AppColor.primaryColor.withOpacity(0.6),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'RECENT ARTICLES',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.5),
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 33,
                        width: 93,
                        decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'View More',
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
                    itemCount: 8,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenSize.width < 800 ? 1 : 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 200,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenSize.height / 9,
                                    child: Text(
                                      'CONFUSED ABOUT NFT: This video explains everything you need to know about NFT and start CASHING OUT',
                                      style: style.copyWith(
                                        fontSize: 13,
                                        color: AppColor.white.withOpacity(0.8),
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
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColor.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                '-  30 mins ago',
                                                style: style.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.normal,
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
                                          color:
                                              AppColor.white.withOpacity(0.5),
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
        ),
      ],
    );
  }
}
