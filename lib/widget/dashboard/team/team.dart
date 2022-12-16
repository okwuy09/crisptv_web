import 'dart:ui';

import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/custom_dropdown.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/model/team.dart';
import 'package:crisptv_media/widget/dashboard/team/add_team_member.dart';
import 'package:crisptv_media/widget/dashboard/team/edit_team_member.dart';
import 'package:crisptv_media/widget/dashboard/team/member_removal.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  String selectedValue = 'ALL';
  List<String> dropDownItem = [
    'ALL',
    'ADMIN',
    'VIDEO EDITOR',
    'COPYWRITER',
    'VOICE-OVER',
    'ANIMATOR',
  ];

  List<TeamMember> teams = [
    TeamMember(
      name: 'Okeke uche',
      position: 'admin',
      imageUrl: 'assets/ps1.png',
      articleNo: 2,
      ongoingTaskNo: 3,
      scheduleNo: 2,
      videoNo: 4,
    ),
    TeamMember(
      name: 'Ifaeayi okey',
      position: 'Editor',
      imageUrl: 'assets/ps2.png',
      articleNo: 10,
      ongoingTaskNo: 2,
      scheduleNo: 1,
      videoNo: 1,
    ),
    TeamMember(
      name: 'Uchenna peace',
      position: 'writer',
      imageUrl: 'assets/ps3.png',
      articleNo: 5,
      ongoingTaskNo: 2,
      scheduleNo: 5,
      videoNo: 5,
    ),
    TeamMember(
      name: 'Judith Okoli',
      position: 'admin & Team Lead',
      imageUrl: 'assets/ps4.png',
      articleNo: 3,
      ongoingTaskNo: 2,
      scheduleNo: 1,
      videoNo: 8,
    ),
    TeamMember(
      name: 'Just Ruth',
      position: 'admin',
      imageUrl: 'assets/street.jpg',
      articleNo: 20,
      ongoingTaskNo: 2,
      scheduleNo: 4,
      videoNo: 10,
    ),
    TeamMember(
      name: 'David okeke',
      position: 'writer',
      imageUrl: 'assets/news.jpg',
      articleNo: 15,
      ongoingTaskNo: 1,
      scheduleNo: 1,
      videoNo: 20,
    ),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                height: 80,
                width: screenSize.width,
                margin: const EdgeInsets.only(bottom: 0.3),
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width / 35),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  border: Border.all(
                    color: AppColor.primaryColor.withOpacity(0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'TEAM MEMBERS:',
                      style: style.copyWith(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(width: 20),
                    CustomDropdown<String>(
                      dropdownColor: AppColor.primaryColor,
                      textColor: AppColor.white.withOpacity(0.6),
                      padding: const EdgeInsets.only(bottom: 3),
                      items: dropDownItem,
                      onChanged: (val) => selectedValue = val,
                      center: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColor.primaryColor,
                  padding: EdgeInsets.all(screenSize.width / 35),
                  child: GridView.builder(
                    itemCount: teams.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenSize.width < 800 ? 1 : 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 320,
                    ),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Stack(
                          children: [
                            selectedIndex == index
                                ? Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                AppColor.white.withOpacity(0.6),
                                          ),
                                          image: const DecorationImage(
                                            image: AssetImage('assets/ps1.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: AppColor.primaryColor
                                            .withOpacity(0.6),
                                      ),
                                    ],
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColor.white.withOpacity(0.6),
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/ps1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: screenSize.width / 5.77,
                                    padding: const EdgeInsets.all(10),
                                    color:
                                        AppColor.primaryColor.withOpacity(0.6),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 35,
                                            child: Text(
                                              'Udeh Judith Chibuzor',
                                              style: style.copyWith(
                                                color: AppColor.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color:
                                                AppColor.white.withOpacity(0.2),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ADMIN & TEAM LEAD',
                                                style: style.copyWith(
                                                  fontSize: 11,
                                                  color: AppColor.white,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.more_vert_outlined,
                                                  color: AppColor.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),

        // VIEWed TEam memeber

        Expanded(
          child: Column(
            children: [
              Container(
                height: 80,
                width: screenSize.width,
                margin: const EdgeInsets.only(bottom: 0.3),
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width / 50),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  border: Border.all(
                    color: AppColor.primaryColor.withOpacity(0.6),
                  ),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 33,
                        width: 157,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColor.white.withOpacity(0.6),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Create New Category',
                            style: style.copyWith(
                              fontSize: 13,
                              color: AppColor.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => const AddNewTeamMemeber(),
                        );
                      },
                      child: Container(
                        height: 33,
                        width: 162,
                        decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Add New Team Member',
                            style: style.copyWith(
                              fontSize: 13,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColor.primaryColor,
                  padding: EdgeInsets.all(screenSize.width / 35),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 320,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(teams[selectedIndex].imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Flexible(
                          child: Container(
                            //height: 360,
                            width: 320,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColor.white.withOpacity(0.5),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NAME',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.white.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  teams[selectedIndex].name,
                                  style: style.copyWith(
                                    fontSize: 14,
                                    color: AppColor.white.withOpacity(0.8),
                                  ),
                                ),
                                Divider(
                                  color: AppColor.white.withOpacity(0.4),
                                  height: 25,
                                ),
                                Text(
                                  'POSITION',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.white.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  teams[selectedIndex].position,
                                  style: style.copyWith(
                                    fontSize: 14,
                                    color: AppColor.white.withOpacity(0.8),
                                  ),
                                ),
                                Divider(
                                  color: AppColor.white.withOpacity(0.4),
                                  height: 25,
                                ),
                                //
                                Text(
                                  'ARTICLES & VIDEOS',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.white.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${teams[selectedIndex].articleNo} Articles & ${teams[selectedIndex].videoNo} Videos',
                                  style: style.copyWith(
                                    fontSize: 14,
                                    color: AppColor.white.withOpacity(0.8),
                                  ),
                                ),
                                Divider(
                                  color: AppColor.white.withOpacity(0.4),
                                  height: 25,
                                ),
                                //
                                Text(
                                  'TASKS ASSIGNED',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.white.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFCC42)
                                            .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${teams[selectedIndex].ongoingTaskNo} Ongoing tasks',
                                          style: style.copyWith(
                                            color: const Color(0xffFFCC42),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.gray,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${teams[selectedIndex].scheduleNo} Scheduled tasks',
                                          style: style.copyWith(
                                            color:
                                                AppColor.white.withOpacity(0.8),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: AppColor.white.withOpacity(0.4),
                                  height: 25,
                                ),
                                //
                                Text(
                                  'QUICK ACTIONS',
                                  style: style.copyWith(
                                    fontSize: 11,
                                    color: AppColor.white.withOpacity(0.4),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (_) => EditTeamMemeber(
                                          name: teams[selectedIndex].name,
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                AppColor.white.withOpacity(0.5),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Edit Employee Details',
                                            style: style.copyWith(
                                              color: AppColor.white
                                                  .withOpacity(0.8),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (_) =>
                                            const RemoveTeamMemeber(),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColor.red,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Remove Employee',
                                            style: style.copyWith(
                                              color: AppColor.red,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   'Click on a team member to view more details and actions',
                    //   style: style.copyWith(
                    //     color: AppColor.white.withOpacity(0.5),
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
