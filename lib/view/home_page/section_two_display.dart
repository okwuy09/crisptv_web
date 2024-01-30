import 'package:cached_network_image/cached_network_image.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/ads.dart';
import 'package:crisptv/service/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/color.dart';

class BusinessDisplay extends StatelessWidget {
  const BusinessDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<SettingController>(context);
    return Container(
      height: 450,
      width: screenSize.width,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          StreamBuilder<Ads>(
              stream: provider.fetchAd1().asStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  var image = snapshot.data!;
                  return CachedNetworkImage(
                    imageUrl: image.imageURL,
                    fit: BoxFit.cover,
                  );
                }
              }),
          ClipRRect(
            // Clip it cleanly.
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.primaryColor.withOpacity(0.5),
                    AppColor.primaryColor.withOpacity(0.5),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BUSINESS DISCOVERY',
                    style: style.copyWith(
                      fontSize: 40,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: screenSize.width < 800
                        ? screenSize.width / 1.5
                        : screenSize.width / 3,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Discover innovative and exciting businesses doing amazing things',
                      style: style.copyWith(
                        fontSize: 15,
                        color: AppColor.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenSize.height / 20),
                  InkWell(
                    onTap: () {
                      //context.go('/news');
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => NewsPage(selectedPage: 'Business'),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
          ),
        ],
      ),
    );
  }
}
