import 'dart:ui';

import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/constant.dart';
import 'package:crisptv/model/category.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/model/team.dart';
import 'package:crisptv/service/category_controller.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/service/user_controller.dart';
import 'package:crisptv/view/dashboard/team/add_team_member.dart';
import 'package:crisptv/view/dashboard/team/edit_team_member.dart';
import 'package:crisptv/view/dashboard/team/member_removal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_team_category.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  Category? _selectedValue;
  late Stream<List<Category>> _category; //= 'Choose from the dropdown';

  @override
  void initState() {
    _category = Provider.of<CategoryController>(context, listen: false)
        .fetchAllTeamCategory();
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<UserController>(context);
    var postProvider = Provider.of<PostController>(context);
    return StreamBuilder<List<TeamMember>>(
        stream: provider.fetchAllTeamMember(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(color: AppColor.primaryColor);
          } else {
            var teamMember = snapshot.data!;
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
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width / 35),
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
                            StreamBuilder<List<Category>>(
                              stream: _category,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return buttonCircularIndicator;
                                } else {
                                  var categories = snapshot.data!;
                                  return Container(
                                    height: 33,
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.8,
                                            style: BorderStyle.solid,
                                            color: AppColor.white
                                                .withOpacity(0.6)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          focusColor: AppColor.lightGray
                                              .withOpacity(0.5)),
                                      child: categories.isEmpty
                                          ? Center(
                                              child: Text(
                                                'No category created',
                                                style: style.copyWith(
                                                    color: AppColor.white
                                                        .withOpacity(0.8)),
                                              ),
                                            )
                                          : DropdownButtonHideUnderline(
                                              child: DropdownButton<Category>(
                                                dropdownColor:
                                                    AppColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                value: _selectedValue ??
                                                    categories[0],
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedValue = newValue;
                                                  });
                                                },
                                                items: categories
                                                    .map((Category f) {
                                                  return DropdownMenuItem<
                                                      Category>(
                                                    value: f,
                                                    child: Text(
                                                      f.name.toUpperCase(),
                                                      style: style.copyWith(
                                                        fontSize: 13,
                                                        color: AppColor.white
                                                            .withOpacity(0.6),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColor.primaryColor,
                          padding: EdgeInsets.all(screenSize.width / 35),
                          child: GridView.builder(
                            itemCount: teamMember.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                    Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: AppColor.white
                                                  .withOpacity(0.6),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  teamMember[index].imageUrl!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: selectedIndex == index
                                              ? AppColor.primaryColor
                                                  .withOpacity(0.7)
                                              : Colors.transparent,
                                        ),
                                      ],
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
                                            color: AppColor.primaryColor
                                                .withOpacity(0.6),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 35,
                                                    child: Text(
                                                      teamMember[index]
                                                          .userName,
                                                      style: style.copyWith(
                                                        color: AppColor.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: AppColor.white
                                                        .withOpacity(0.2),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        capitalizeAfterDot(
                                                            teamMember[index]
                                                                .position
                                                                .toLowerCase()),
                                                        style: style.copyWith(
                                                          fontSize: 12,
                                                          color: AppColor.white,
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Container()),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width / 50),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          border: Border.all(
                            color: AppColor.primaryColor.withOpacity(0.6),
                          ),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => showDialog(
                                context: context,
                                builder: (_) => const CreateTeamCategory(),
                              ),
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
                                      image: NetworkImage(
                                          teamMember[selectedIndex].imageUrl!),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'NAME',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            color:
                                                AppColor.white.withOpacity(0.4),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          teamMember[selectedIndex].userName,
                                          style: style.copyWith(
                                            fontSize: 14,
                                            color:
                                                AppColor.white.withOpacity(0.8),
                                          ),
                                        ),
                                        Divider(
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                          height: 25,
                                        ),
                                        Text(
                                          'POSITION',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            color:
                                                AppColor.white.withOpacity(0.4),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          capitalizeAfterDot(
                                              teamMember[selectedIndex]
                                                  .position
                                                  .toLowerCase()),
                                          style: style.copyWith(
                                            fontSize: 12,
                                            color:
                                                AppColor.white.withOpacity(0.8),
                                          ),
                                        ),
                                        Divider(
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                          height: 25,
                                        ),
                                        //
                                        Text(
                                          'ARTICLES & VIDEOS',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            color:
                                                AppColor.white.withOpacity(0.4),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        StreamBuilder<List<Posts>>(
                                            stream: postProvider
                                                .fetchAllPost('news'),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Container(
                                                  color: AppColor.primaryColor,
                                                );
                                              } else {
                                                var post = snapshot.data!
                                                    .where((e) =>
                                                        e.posterName.trim() ==
                                                        teamMember[
                                                                selectedIndex]
                                                            .userName
                                                            .trim())
                                                    .toList();
                                                var article = post
                                                    .where((e) =>
                                                        e.postType == 'news')
                                                    .toList();
                                                var video = post
                                                    .where((e) =>
                                                        e.postType == 'video')
                                                    .toList();

                                                return Text(
                                                  '${article.length}  Articles  &  ${video.length}  Videos',
                                                  style: style.copyWith(
                                                    fontSize: 14,
                                                    color: AppColor.white
                                                        .withOpacity(0.8),
                                                  ),
                                                );
                                              }
                                            }),
                                        Divider(
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                          height: 25,
                                        ),
                                        //
                                        Text(
                                          'TASKS ASSIGNED',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            color:
                                                AppColor.white.withOpacity(0.4),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFFCC42)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${teamMember[selectedIndex].ongoingTaskNo} Ongoing tasks',
                                                  style: style.copyWith(
                                                    color:
                                                        const Color(0xffFFCC42),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColor.gray,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${teamMember[selectedIndex].scheduleNo} Scheduled tasks',
                                                  style: style.copyWith(
                                                    color: AppColor.white
                                                        .withOpacity(0.8),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                          height: 25,
                                        ),
                                        //
                                        Text(
                                          'QUICK ACTIONS',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            color:
                                                AppColor.white.withOpacity(0.4),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () => showDialog(
                                                context: context,
                                                builder: (_) => EditTeamMemeber(
                                                  teamMember:
                                                      teamMember[selectedIndex],
                                                ),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: AppColor.white
                                                        .withOpacity(0.5),
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
                                                    RemoveTeamMemeber(
                                                  teamMember:
                                                      teamMember[selectedIndex],
                                                ),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
        });
  }
}
