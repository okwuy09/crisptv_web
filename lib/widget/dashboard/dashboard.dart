import 'package:crisptv_media/component/admin_button.dart';
import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/general_setting.dart';
import 'package:crisptv_media/widget/dashboard/overview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isdarkmode = false;

  List<bool> isclicked = [
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> headText = [
    'Overview',
    'Videos',
    'News Articles',
    'Team',
    'Task Sheet',
  ];

  String titleHead = 'Overview';

  Widget _getBodyWidget(currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Expanded(child: Overview());
      case 1:
        return const Expanded(child: GeneralSettings());

      case 2:
        return Expanded(
          child: Container(
            color: Colors.green,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        );

      case 3:
        return Expanded(
          child: Container(
            color: Colors.yellow,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        );

      case 4:
        return Expanded(
          child: Container(
            color: Colors.purple,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        );

      default:
        return Container();
    }
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: Container(
          color: AppColor.primaryColor,
          margin: const EdgeInsets.only(bottom: 0.3),
          padding: EdgeInsets.only(right: screenSize.width / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: AppColor.primaryColor,
                width: screenSize.width / 11,
                height: 80,
                child: InkWell(
                  onTap: () => context.go('/'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo_2.png',
                        fit: BoxFit.cover,
                        width: 55,
                        height: 55,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 0.2,
                color: AppColor.white,
              ),
              SizedBox(width: screenSize.width / 20),
              Text(
                titleHead,
                style: style.copyWith(
                  color: AppColor.white,
                  fontSize: 18,
                ),
              ),
              Expanded(flex: 2, child: Container()),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: TextField(
                    style: style.copyWith(
                      fontSize: 14,
                      color: AppColor.white.withOpacity(0.6),
                    ),
                    // controller: widget.delegate._queryTextController,
                    // focusNode: focusNode,
                    // style: theme.textTheme.headline6,
                    // textInputAction: widget.delegate.textInputAction,
                    // keyboardType: widget.delegate.keyboardType,
                    // onChanged: widget.delegate.onChange,
                    // onSubmitted: widget.delegate.onSubmit,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.white.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.white.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: AppColor.white.withOpacity(0.5),
                      ),
                      hintText: 'Search',
                      hintStyle: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenSize.width / 30),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.gray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: AppColor.white,
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
                        child: Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: AppColor.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenSize.width / 40),
              Container(
                height: 30,
                width: 1,
                color: AppColor.white.withOpacity(0.4),
              ),
              SizedBox(width: screenSize.width / 40),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/ps1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Judith Udeh',
                        style: style.copyWith(
                          color: AppColor.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Admin',
                        style: style.copyWith(
                          color: AppColor.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(width: screenSize.width / 30),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.gray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.exit_to_app_rounded,
                  color: AppColor.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: AppColor.primaryColor,
                  width: screenSize.width / 11,
                  height: screenSize.height * 1.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: screenSize.height / 30),
                      // CircleAvatar(
                      //   radius: 35,
                      //   backgroundColor: AppColor.white,
                      //   backgroundImage: const AssetImage('assets/ps2.jpg'),
                      // ),
                      // const SizedBox(height: 20),
                      // Text(
                      //   'Frank Okeke',
                      //   style: style.copyWith(
                      //     fontSize: 15,
                      //     color: AppColor.white.withOpacity(0.8),
                      //   ),
                      // ),
                      // const SizedBox(height: 2),
                      // Text(
                      //   'Frank@gmail.com',
                      //   style: style.copyWith(
                      //     fontSize: 13,
                      //     color: AppColor.white.withOpacity(0.6),
                      //   ),
                      // ),
                      //SizedBox(height: screenSize.height / 15),
                      // Divider(
                      //   height: 0,
                      //   color: AppColor.white.withOpacity(0.3),
                      // ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isclicked.replaceRange(0, isclicked.length, [
                              for (int i = 0; i < isclicked.length; i++) false
                            ]);
                            isclicked[0] = true;
                            titleHead = headText[0];
                          });
                          pageIndex = 0;
                        },
                        child: AdminButton(
                          color: isclicked[0]
                              ? AppColor.red
                              : AppColor.primaryColor,
                          icon: Icons.home_outlined,
                          iconcolor: isclicked[0]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),
                      //
                      InkWell(
                        onTap: () {
                          setState(() {
                            isclicked.replaceRange(0, isclicked.length, [
                              for (int i = 0; i < isclicked.length; i++) false
                            ]);
                            isclicked[1] = true;
                            titleHead = headText[1];
                          });
                          pageIndex = 1;
                        },
                        child: AdminButton(
                          color: isclicked[1]
                              ? AppColor.red
                              : AppColor.primaryColor,
                          icon: Icons.videocam_outlined,
                          iconcolor: isclicked[1]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),
                      //
                      InkWell(
                        onTap: () {
                          setState(() {
                            isclicked.replaceRange(0, isclicked.length, [
                              for (int i = 0; i < isclicked.length; i++) false
                            ]);
                            isclicked[2] = true;
                            titleHead = headText[2];
                          });
                          pageIndex = 2;
                        },
                        child: AdminButton(
                          color: isclicked[2]
                              ? AppColor.red
                              : AppColor.primaryColor,
                          icon: Icons.post_add_rounded,
                          iconcolor: isclicked[2]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),
                      //
                      InkWell(
                        onTap: () {
                          setState(() {
                            isclicked.replaceRange(0, isclicked.length, [
                              for (int i = 0; i < isclicked.length; i++) false
                            ]);
                            isclicked[3] = true;
                            titleHead = headText[3];
                          });
                          pageIndex = 3;
                        },
                        child: AdminButton(
                          color: isclicked[3]
                              ? AppColor.red
                              : AppColor.primaryColor,
                          icon: Icons.view_agenda_outlined,
                          iconcolor: isclicked[3]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),
                      //
                      InkWell(
                        onTap: () {
                          setState(() {
                            isclicked.replaceRange(0, isclicked.length, [
                              for (int i = 0; i < isclicked.length; i++) false
                            ]);
                            isclicked[4] = true;
                            titleHead = headText[4];
                          });
                          pageIndex = 4;
                        },
                        child: AdminButton(
                          color: isclicked[4]
                              ? AppColor.red
                              : AppColor.primaryColor,
                          icon: Icons.settings_outlined,
                          iconcolor: isclicked[4]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),

                      // darkmood
                      SizedBox(height: screenSize.height / 20),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isclicked.replaceRange(0, isclicked.length, [
                                for (int i = 0; i < isclicked.length; i++) false
                              ]);
                              isclicked[4] = true;
                              titleHead = headText[4];
                            });
                            pageIndex = 4;
                          },
                          child: Container(
                            height: 80,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColor.lightGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: screenSize.height * 1.1,
                    //color: Colors.red,
                    child: Column(
                      children: [
                        //const SizedBox(height: 20),
                        _getBodyWidget(pageIndex),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
