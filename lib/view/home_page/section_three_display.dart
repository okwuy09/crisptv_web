import 'package:cached_network_image/cached_network_image.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/ads.dart';
import 'package:crisptv/service/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../component/color.dart';

class PodCastsDisplay extends StatelessWidget {
  const PodCastsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<SettingController>(context);
    return Container(
      width: screenSize.width,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: screenSize.width < 1100
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LIVE PODCASTS',
                      style: style.copyWith(
                        fontSize: 40,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Inspiring and educational podcasts.',
                      style: style.copyWith(
                        fontSize: 15,
                        color: AppColor.white,
                      ),
                      textAlign: screenSize.width < 800
                          ? TextAlign.center
                          : TextAlign.start,
                    ),
                    SizedBox(height: screenSize.height / 20),
                    InkWell(
                      onTap: () => context.go('/live-sessions'),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: StreamBuilder<Ads>(
                      stream: provider.fetchAd2().asStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          var image = snapshot.data!;
                          return CachedNetworkImage(
                            imageUrl: image.imageURL,
                            fit: BoxFit.cover,
                            height: 360,
                            width: 600,
                          );
                        }
                      }),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: screenSize.width < 800
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LIVE PODCASTS',
                      style: style.copyWith(
                        fontSize: 40,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Inspiring and educational podcasts.',
                      style: style.copyWith(
                        fontSize: 15,
                        color: AppColor.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: screenSize.height / 20),
                    InkWell(
                      onTap: () => context.go('/live-sessions'),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: StreamBuilder<Ads>(
                      stream: provider.fetchAd2().asStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          var image = snapshot.data!;
                          return CachedNetworkImage(
                            imageUrl: image.imageURL,
                            fit: BoxFit.cover,
                            height: 360,
                            width: 600,
                          );
                        }
                      }),
                ),
              ],
            ),
    );
  }
}
