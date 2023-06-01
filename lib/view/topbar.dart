import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/view/menu_drawal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBarContents extends StatefulWidget {
  final Widget child;
  bool extendBody;
  int homeIndex;
  Color? backgroundColor;
  TopBarContents({
    Key? key,
    required this.child,
    required this.backgroundColor,
    this.extendBody = false,
    this.homeIndex = 0,
  }) : super(key: key);

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> clicked = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final List<bool> _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  bool isSignIn = false;
  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      extendBodyBehindAppBar: widget.extendBody,
      drawer: screenSize.width < 800 ? const MenuDrawer() : Container(),
      appBar: screenSize.width < 800
          ? AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: AppColor.white),
              backgroundColor: widget.backgroundColor,
              title: Row(
                children: [
                  InkWell(
                    onTap: () => context.go('/'),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                      width: 110,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.search,
                    color: AppColor.white,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      context.go('/signup');
                    },
                    child: Container(
                      width: 80,
                      height: 35,
                      decoration: BoxDecoration(
                        color: AppColor.gray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: style.copyWith(
                            fontSize: 12,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: Container(
                color: widget.backgroundColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width / 20,
                    vertical: 5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => context.go('/'),
                              child: Image.asset(
                                'assets/logo.png',
                                fit: BoxFit.cover,
                                //height: 50,
                                width: 130,
                              ),
                            ),
                            //SizedBox(width: screenSize.width / 10),
                            Expanded(child: Container()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[0] = true
                                          : _isHovering[0] = false;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      clicked.replaceRange(0, clicked.length, [
                                        for (int i = 0; i < clicked.length; i++)
                                          false
                                      ]);
                                      widget.homeIndex = 0;
                                    });
                                    context.go('/');
                                  },
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Home',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: widget.homeIndex ==
                                                    0 //_isHovering[0]
                                                ? AppColor.white
                                                : AppColor.white
                                                    .withOpacity(0.5),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Visibility(
                                          maintainAnimation: true,
                                          maintainState: true,
                                          maintainSize: true,
                                          visible: widget.homeIndex ==
                                              0, //_isHovering[0],
                                          child: Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                //
                                SizedBox(width: screenSize.width / 30),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[1] = true
                                          : _isHovering[1] = false;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      clicked.replaceRange(0, clicked.length, [
                                        for (int i = 0; i < clicked.length; i++)
                                          false
                                      ]);
                                      widget.homeIndex = 1;
                                    });
                                    context.go('/shows');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Shows',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: widget.homeIndex ==
                                                  1 // _isHovering[1]
                                              ? AppColor.white
                                              : AppColor.white.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Visibility(
                                        maintainAnimation: true,
                                        maintainState: true,
                                        maintainSize: true,
                                        visible: widget.homeIndex ==
                                            1, //_isHovering[0],
                                        child: Container(
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                SizedBox(width: screenSize.width / 30),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[2] = true
                                          : _isHovering[2] = false;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      clicked.replaceRange(0, clicked.length, [
                                        for (int i = 0; i < clicked.length; i++)
                                          false
                                      ]);
                                      widget.homeIndex = 2;
                                    });
                                    context.go('/news');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'News',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: widget.homeIndex == 2
                                              //1 _isHovering[2]
                                              ? AppColor.white
                                              : AppColor.white.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Visibility(
                                        maintainAnimation: true,
                                        maintainState: true,
                                        maintainSize: true,
                                        visible: widget.homeIndex ==
                                            2, //_isHovering[1],
                                        child: Container(
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //

                                SizedBox(width: screenSize.width / 30),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[3] = true
                                          : _isHovering[3] = false;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      clicked.replaceRange(0, clicked.length, [
                                        for (int i = 0; i < clicked.length; i++)
                                          false
                                      ]);
                                      widget.homeIndex = 3;
                                    });
                                    context.go('/live-sessions');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Live Sessions',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: widget.homeIndex ==
                                                  3 //_isHovering[3]
                                              ? AppColor.white
                                              : AppColor.white.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Visibility(
                                        maintainAnimation: true,
                                        maintainState: true,
                                        maintainSize: true,
                                        visible: widget.homeIndex ==
                                            3, //_isHovering[2],
                                        child: Container(
                                          height: 6,
                                          width: 6,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       clicked.replaceRange(0, clicked.length,
                            //           [for (int i = 0; i < clicked.length; i++) false]);
                            //       homeIndex = 5;
                            //     });
                            //     context.go('/signin');
                            //   },
                            //   child: Container(
                            //     width: 80,
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //       color: homeIndex == 5
                            //           ? AppColor.primaryColor
                            //           : AppColor.white,
                            //       borderRadius: BorderRadius.circular(6),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //         'SIGN IN',
                            //         style: style.copyWith(
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.w500,
                            //           color: homeIndex == 5
                            //               ? AppColor.white
                            //               : AppColor.primaryColor,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(width: 20),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       clicked.replaceRange(0, clicked.length,
                            //           [for (int i = 0; i < clicked.length; i++) false]);
                            //       homeIndex = 6;
                            //     });
                            //     context.go('/signup');
                            //   },
                            //   child: Container(
                            //     width: 80,
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //       color: homeIndex == 6
                            //           ? AppColor.primaryColor
                            //           : AppColor.white,
                            //       borderRadius: BorderRadius.circular(6),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //         'SIGN UP',
                            //         style: style.copyWith(
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.w500,
                            //           color: homeIndex == 6
                            //               ? AppColor.white
                            //               : AppColor.primaryColor,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            //SizedBox(width: screenSize.width / 5),
                            Expanded(child: Container()),
                            Icon(
                              Icons.search,
                              color: AppColor.white,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                context.go('/admin');
                              },
                              child: Container(
                                width: 109,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColor.gray,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN UP',
                                    style: style.copyWith(
                                      fontSize: 12,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      body: widget.child,
    );
  }
}
