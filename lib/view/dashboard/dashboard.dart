import 'package:crisptv/component/admin_button.dart';
import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/custom_switch.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/team.dart';
import 'package:crisptv/model/users.dart';
import 'package:crisptv/service/authentication_controller.dart';
import 'package:crisptv/service/user_controller.dart';
import 'package:crisptv/view/dashboard/general_setting.dart';
import 'package:crisptv/view/dashboard/news_article/news_article.dart';
import 'package:crisptv/view/dashboard/overview.dart';
import 'package:crisptv/view/dashboard/task_sheet/tasks.dart';
import 'package:crisptv/view/dashboard/team/team.dart';
import 'package:crisptv/view/dashboard/video/video.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isdarkmode = false;

  List<bool> isclicked = [
    true,
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
    'Settings'
  ];

  String titleHead = 'Overview';

  bool switched = false;

  /// switch case to navigate through dashboard pages
  Widget _getBodyWidget(currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Expanded(child: Overview());
      case 1:
        return const Expanded(child: Videos());

      case 2:
        return const Expanded(child: NewsArticles());

      case 3:
        return const Expanded(child: Team());

      case 4:
        return const Expanded(child: UserTask());
      case 5:
        return const Expanded(child: GeneralSettings());

      default:
        return Container();
    }
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<AuthenticationController>(context);
    var userProvider = Provider.of<UserController>(context);
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
                    cursorColor: AppColor.white.withOpacity(0.5),
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
              StreamBuilder<Users>(
                stream: userProvider.fetchUserProfile().asStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      color: AppColor.primaryColor,
                    );
                  } else {
                    var user = snapshot.data!;
                    return Row(
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
                            child: Image.network(
                              user.avatar!,
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
                              user.fullName!,
                              style: style.copyWith(
                                color: AppColor.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 3),
                            StreamBuilder<List<TeamMember>>(
                              stream: userProvider.fetchAllTeamMember(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                    color: AppColor.primaryColor,
                                  );
                                } else {
                                  var team = snapshot.data!
                                      .where((e) => e.userID == user.id)
                                      .toList();
                                  return Text(
                                    capitalizeAfterDot(
                                        team[0].position.toLowerCase()),
                                    style: style.copyWith(
                                      color: AppColor.white.withOpacity(0.6),
                                      fontSize: 12,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  }
                },
              ),
              SizedBox(width: screenSize.width / 30),
              InkWell(
                onTap: () async => await provider.signOut(context: context),
                child: Container(
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
                  height: screenSize.height * 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// overView
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

                      /// videos
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

                      /// News articles
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

                      /// TEAM
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
                          icon: Icons.people_outline,
                          iconcolor: isclicked[3]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),

                      /// Task Sheet
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
                          icon: Icons.view_agenda_outlined,
                          iconcolor: isclicked[4]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),

                      /// Settings
                      InkWell(
                        onTap: () {
                          setState(() {
                            isclicked.replaceRange(0, isclicked.length, [
                              for (int i = 0; i < isclicked.length; i++) false
                            ]);
                            isclicked[5] = true;
                            titleHead = headText[5];
                          });
                          pageIndex = 5;
                        },
                        child: AdminButton(
                          color: isclicked[5]
                              ? AppColor.red
                              : AppColor.primaryColor,
                          icon: Icons.settings_outlined,
                          iconcolor: isclicked[5]
                              ? AppColor.white
                              : AppColor.white.withOpacity(0.4),
                        ),
                      ),

                      // darkmood
                      SizedBox(height: screenSize.height / 10),
                      CustomSwitch(
                        value: switched,
                        disableColor: AppColor.lightGray.withOpacity(0.6),
                        enableColor: AppColor.white.withOpacity(0.4),
                        onChanged: ((value) {
                          setState(() {
                            switched = value;
                          });
                        }),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: screenSize.height * 1.3,
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
