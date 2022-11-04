import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import '../component/color.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  static Color gradientStartColor = AppColor.gray;
  static Color gradientEndColor = AppColor.gray;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(0.0)),
        gradient: LinearGradient(
            colors: [
              gradientStartColor,
              gradientEndColor,
            ],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(1.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: const EdgeInsets.all(20),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 120,
                        ),
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
                      ],
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Stay up to date by signing up to our newsletter',
                          style: style.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 320,
                              child: TextFormField(
                                style:
                                    style.copyWith(fontWeight: FontWeight.w400),
                                autofillHints: const [AutofillHints.email],
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.black54,
                                decoration: InputDecoration(
                                  fillColor: AppColor.white,
                                  filled: true,
                                  hintText: 'Enter your email',
                                  hintStyle: style.copyWith(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.5)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 44,
                                width: 117,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Subscribe',
                                    style: style,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Divider(
                  color: Colors.white,
                  thickness: 0,
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '© 2022 CrispTv Media. All rights reserved.',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Privacy',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Cookies',
                          style: style.copyWith(
                            fontSize: 14,
                            color: AppColor.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 120,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
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
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Stay up to date by signing up to our newsletter',
                          style: style.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            SizedBox(
                              width: 342,
                              child: TextFormField(
                                style:
                                    style.copyWith(fontWeight: FontWeight.w400),
                                autofillHints: const [AutofillHints.email],
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.black54,
                                decoration: InputDecoration(
                                  fillColor: AppColor.white,
                                  filled: true,
                                  hintText: 'Enter your email',
                                  hintStyle: style.copyWith(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.5)),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 44,
                                width: 117,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Subscribe',
                                    style: style,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Divider(
                  color: Colors.white,
                  thickness: 0,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '© 2022 CrispTv Media. All rights reserved.',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Terms',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Privacy',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Cookies',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
