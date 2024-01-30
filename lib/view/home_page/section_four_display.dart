import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/slide.dart';
import 'package:crisptv/service/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/color.dart';

class ShortFilmDisplay extends StatelessWidget {
  const ShortFilmDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var settingProvider = Provider.of<SettingController>(context);
    return Container(
      width: screenSize.width,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: StreamBuilder<Slide>(
          stream: settingProvider.fetchSlide().asStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return buttonCircularIndicator;
            } else {
              return screenSize.width < 1100
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SHORT FILMS',
                              style: style.copyWith(
                                fontSize: 40,
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Funny and exciting short films that will make you laugh and also learn.',
                              style: style.copyWith(
                                fontSize: 15,
                                color: AppColor.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenSize.height / 20),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.ondemand_video_outlined,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'WATCH NOW',
                                      style: style.copyWith(
                                        color: AppColor.primaryColor,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height / 20),
                        SizedBox(
                          height: 400,
                          width: screenSize.width / 1.15,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              reverse: true,
                              viewportFraction: 1,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: snapshot.data!.imageURL.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: image,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SHORT FILMS',
                              style: style.copyWith(
                                fontSize: 40,
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Funny and exciting short films that will make you laugh and \nalso learn.',
                              style: style.copyWith(
                                fontSize: 15,
                                color: AppColor.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: screenSize.height / 20),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.ondemand_video_outlined,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'WATCH NOW',
                                      style: style.copyWith(
                                        color: AppColor.primaryColor,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 400,
                          width: 600,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              reverse: true,
                              viewportFraction: 1,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: snapshot.data!.imageURL.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: image,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
            }
          }),
    );
  }
}
