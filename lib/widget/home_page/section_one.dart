import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.width < 800 ? 380 : 450,
      width: screenSize.width,
      margin: EdgeInsets.only(top: screenSize.height / 7),
      padding: EdgeInsets.symmetric(horizontal: screenSize.width / 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPLORE OUR SHOWS',
            style: style.copyWith(
              fontSize: 20,
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: screenSize.width < 800 ? 240 : 350,
            child: Stack(
              children: [
                ListView.builder(
                  controller: _controller,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: screenSize.width < 800 ? 240 : 350,
                          width: screenSize.width < 800 ? 210 : 300,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage('assets/street.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Container(
                            height: screenSize.width < 800 ? 50 : 70,
                            width: screenSize.width < 800 ? 195 : 285,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: AppColor.gray.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Conto Content Here',
                                  style: style.copyWith(color: AppColor.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColor.white,
                                  size: 25,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                screenSize.width < 800
                    ? Container()
                    : Positioned(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _controller.animateTo(
                                    _controller.position.minScrollExtent,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColor.gray.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  _controller.animateTo(
                                    _controller.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColor.gray.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
