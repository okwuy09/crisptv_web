import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../component/color.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
        width: screenSize.width,
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.primaryColor,
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    context.go('/');
                  },
                  child: Text(
                    'HOME',
                    style: style.copyWith(
                      color: AppColor.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20,
                  ),
                  child: Divider(
                    color: AppColor.white.withOpacity(0.2),
                  ),
                ),
                //

                InkWell(
                  onTap: () {
                    context.go('/shows');
                  },
                  child: Text(
                    'Shows',
                    style: style.copyWith(
                      color: AppColor.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20,
                  ),
                  child: Divider(
                    color: AppColor.white.withOpacity(0.2),
                  ),
                ),
                //
                InkWell(
                  onTap: () {
                    context.go('/news');
                  },
                  child: Text(
                    'News',
                    style: style.copyWith(
                      color: AppColor.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20,
                  ),
                  child: Divider(
                    color: AppColor.white.withOpacity(0.2),
                  ),
                ),

                InkWell(
                  onTap: () {
                    context.go('/live-sessions');
                  },
                  child: Text(
                    'Live Sessions',
                    style: style.copyWith(
                      color: AppColor.white.withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColor.white.withOpacity(0.8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Close',
                        style: style.copyWith(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height / 5.2),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/twitter.png',
                            height: 25,
                          ),
                          const SizedBox(width: 20),
                          Image.asset(
                            'assets/linkedin.png',
                            height: 25,
                          ),
                          const SizedBox(width: 20),
                          Image.asset(
                            'assets/facebook.png',
                            height: 25,
                          ),
                          const SizedBox(width: 20),
                          Image.asset(
                            'assets/dribble.png',
                            height: 25,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terms',
                            style: style.copyWith(
                              fontSize: 14,
                              color: AppColor.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            'Privacy',
                            style: style.copyWith(
                              fontSize: 14,
                              color: AppColor.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            'Cookies',
                            style: style.copyWith(
                              fontSize: 14,
                              color: AppColor.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Text(
                        '© 2022 CrispTv Media. All rights reserved.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
