import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/post_controller.dart';
import 'package:crisptv/view/search/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/style.dart';

class CustomSearchDelegate extends SearchDelegate {
  // appbar color
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      focusColor: AppColor.primaryColor,
      unselectedWidgetColor: AppColor.primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.white,
        selectionColor: AppColor.white,
      ),
      scaffoldBackgroundColor: AppColor.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primaryColor, iconTheme: IconThemeData()),
      hintColor: AppColor.white,
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: style.copyWith(
          color: AppColor.white.withOpacity(0.5),
        ),
      ),
      textTheme: TextTheme(titleMedium: style.copyWith(color: AppColor.white)),
    );
  }

  // first overwrite to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear_rounded,
          color: AppColor.white,
        ),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColor.white,
      ),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    var provider = Provider.of<PostController>(context);
    return StreamBuilder<List<Posts>>(
      stream: provider.fetchAllPost(''),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var posts = snapshot.data!;

          var post = posts
              .where((e) => e.title.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 5),
              shrinkWrap: true,
              itemCount: post.length,
              itemBuilder: (context, index) {
                return SearchPostWidget(
                  post: post[index],
                );
              },
            ),
          );
        } else {
          return Align(
            alignment: Alignment.center,
            child: Text(
              'LOADING...',
              style: style.copyWith(
                color: AppColor.white,
                fontSize: 12,
              ),
            ),
          );
        }
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    var provider = Provider.of<PostController>(context);
    return StreamBuilder<List<Posts>>(
      stream: provider.fetchAllPost(''),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var posts = snapshot.data!;

          var post = posts
              .where((e) => e.title.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 5),
              shrinkWrap: true,
              itemCount: post.length,
              itemBuilder: (context, index) {
                return SearchPostWidget(
                  post: post[index],
                );
              },
            ),
          );
        } else {
          return Align(
            alignment: Alignment.center,
            child: Text(
              'LOADING...',
              style: style.copyWith(
                color: AppColor.white,
                fontSize: 12,
              ),
            ),
          );
        }
      },
    );
  }
}
