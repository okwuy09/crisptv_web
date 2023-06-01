import 'package:crisptv/component/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../component/color.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final List<bool> clicked = [
    false,
    false,
    false,
    false,
    // false,
    // false,
  ];
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
                    // clicked.replaceRange(0, clicked.length,
                    //     [for (int i = 0; i < clicked.length; i++) false]);
                    context.pop();
                    context.go('/');
                  },
                  child: Text(
                    'Home',
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
                    context.pop();
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
                    context.pop();
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
                    context.pop();
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
                  onTap: () => context.pop(),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColor.white.withOpacity(0.6),
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
                          InkWell(
                            onTap: _twitterURL,
                            child: Image.asset(
                              'assets/twitter.png',
                              height: 25,
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: _linkedInURL,
                            child: Image.asset(
                              'assets/linkedin.png',
                              height: 25,
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: _facebookURL,
                            child: Image.asset(
                              'assets/facebook.png',
                              height: 25,
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: _instagramURL,
                            child: Image.asset(
                              'assets/instagram.png',
                              height: 25,
                            ),
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

  _twitterURL() async {
    const url = 'https://twitter.com';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  _linkedInURL() async {
    const url = 'https://www.linkedin.com';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  _facebookURL() async {
    const url = 'https://www.facebook.com/';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  _instagramURL() async {
    const url = 'https://www.instagram.com';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
