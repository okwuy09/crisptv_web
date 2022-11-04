import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import '../../component/color.dart';

class SectionFourDisplay extends StatelessWidget {
  const SectionFourDisplay({super.key});

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
            'assets/street.jpg',
            fit: BoxFit.cover,
          ),
          ClipRRect(
            // Clip it cleanly.
            child: Container(
              padding: EdgeInsets.only(right: screenSize.width / 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primaryColor.withOpacity(0.4),
                    // AppColor.primaryColor,
                    // AppColor.primaryColor,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: screenSize.width < 800
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.end,
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
                    screenSize.width < 800
                        ? 'Funny and exciting short films that will make you laugh and also learn.'
                        : 'Funny and exciting short films that will make\nyou laugh and also learn.',
                    style: style.copyWith(
                      fontSize: 15,
                      color: AppColor.white,
                    ),
                    textAlign: screenSize.width < 800
                        ? TextAlign.center
                        : TextAlign.end,
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
