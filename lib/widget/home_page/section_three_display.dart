import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../component/color.dart';

class SectionThreeDisplay extends StatelessWidget {
  const SectionThreeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.width < 800
          ? screenSize.height / 2
          : screenSize.height / 1.4,
      width: screenSize.width,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/news.jpg',
            fit: BoxFit.cover,
          ),
          ClipRRect(
            // Clip it cleanly.
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primaryColor.withOpacity(0.4),
                  ],
                ),
              ),
              child: Column(
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
                    textAlign: TextAlign.center,
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
