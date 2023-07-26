import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/search/post_widget.dart';
import 'package:crisptv/view/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPost extends StatefulWidget {
  const SearchPost({super.key});

  @override
  State<SearchPost> createState() => _SearchPostState();
}

final TextEditingController _search = TextEditingController();

class _SearchPostState extends State<SearchPost> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PostController>(context);
    var size = MediaQuery.of(context).size;
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 20),
        child: Column(
          children: [
            Divider(
              color: AppColor.white.withOpacity(0.3),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              width: size.width,
              child: TextField(
                style: style.copyWith(color: AppColor.white),
                controller: _search,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.primaryColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColor.white.withOpacity(0.4), width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: AppColor.white.withOpacity(0.4), width: 0.5),
                  ),
                  hintText: "Search",
                  hintStyle: style.copyWith(
                    color: AppColor.white.withOpacity(0.5),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: AppColor.white.withOpacity(0.5),
                ),
                onChanged: (value) => setState(() {}),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: StreamBuilder<List<Posts>>(
                stream: provider.fetchAllPost(''),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var post = snapshot.data!;
                    if (_search.text == '') {
                      return MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 5),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: post.length,
                          itemBuilder: (context, index) {
                            return SearchPostWidget(
                              post: post[index],
                            );
                          },
                        ),
                      );
                    } else {
                      var postSearch = post
                          .where((e) => e.title
                              .toLowerCase()
                              .contains(_search.text.toLowerCase()))
                          .toList();
                      return MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 5),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: postSearch.length,
                          itemBuilder: (context, index) {
                            return SearchPostWidget(
                              post: postSearch[index],
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        'LOADING...',
                        style: style.copyWith(
                          color: AppColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  showSearch(context: context, delegate: CustomSearchDelegate(), );
}
