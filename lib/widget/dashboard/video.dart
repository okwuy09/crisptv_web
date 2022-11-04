import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/custom_dropdown.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import '../../component/drag_dropwidget.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  String selectedValue = 'ALL';
  List<String> dropDownItem = [
    'ALL',
    'INSIGHTS',
    'CONTO',
    'ROUNDTABLE',
    'MIND OVER MATTER',
    'INSPIRING STORIES',
    'PODCASTS',
    'BUSINESS DISCOVERY',
    'SHORT FILMS',
    'KNOW YOUR HEROES',
    'GAME CHANGERS',
    'POLITICS NOW',
    'TALK OR DRINK',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 80,
          width: screenSize.width,
          margin: const EdgeInsets.only(bottom: 0.3),
          padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CATEGORIES:',
                style: style.copyWith(
                  fontSize: 14,
                  color: AppColor.white.withOpacity(0.6),
                ),
              ),
              const SizedBox(width: 20),
              CustomDropdown<String>(
                padding: const EdgeInsets.only(bottom: 3),
                items: dropDownItem,
                onChanged: (val) => selectedValue = val,
                center: true,
              ),
              Expanded(child: Container()),
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
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => const DragAndDropWidget());
                },
                child: Container(
                  height: 33,
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColor.lightGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Upload Video',
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
            child: GridView.builder(
              itemCount: 12,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenSize.width < 800 ? 1 : 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 310,
              ),
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.white.withOpacity(0.6),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          //borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                            image: AssetImage('assets/ps1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.height / 10,
                              child: Text(
                                'CONFUSED ABOUT NFT: This video explains everything you need to know about NFT and start CASHING OUT',
                                style: style.copyWith(
                                  fontSize: 13,
                                  color: AppColor.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.white.withOpacity(0.4),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Uploaded by  David Christopher',
                                      style: style.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: AppColor.white.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          'INSIGHTS',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color: AppColor.blue,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '-  30 mins ago',
                                          style: style.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                AppColor.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_vert_outlined,
                                    color: AppColor.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            )
                          ],
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
    );
  }
}
