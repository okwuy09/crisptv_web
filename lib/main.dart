import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/widget/dashboard/news_article/text_editor.dart';
import 'package:crisptv_media/widget/live_session/live_session.dart';
import 'package:crisptv_media/widget/news/news.dart';
import 'package:crisptv_media/widget/post_detail.dart';
import 'package:crisptv_media/widget/show/show.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'component/color.dart';
import 'widget/dashboard/dashboard.dart';
import 'widget/home_page/home_page.dart';
import 'widget/topbar.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
      title: 'Crisptv-media',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: AppColor.white,
      ),
      // home: const HomePage(),
    );
  }

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    errorBuilder: ((context, state) => ErrorScreen(error: state.error)),
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '/shows',
        builder: (BuildContext context, GoRouterState state) =>
            const ShowsPage(),
      ),
      GoRoute(
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) =>
            const DashBoard(),
        routes: <RouteBase>[
          GoRoute(
            path: ':name',
            name: 'new_article',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return const TextEditor();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/news',
        builder: (BuildContext context, GoRouterState state) => NewsPage(),
        routes: <RouteBase>[
          GoRoute(
            path: ':newsdetail',
            name: 'news_detail',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              // state.extra; use to pass data to another page
              return const PostDetail();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/live-sessions',
        builder: (BuildContext context, GoRouterState state) =>
            const LiveSessions(),
      ),
      // GoRoute(
      //   path: '/advice',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const AdvicePage(),
      // ),
      // GoRoute(
      //   path: '/signup',
      //   builder: (BuildContext context, GoRouterState state) => const SignUp(),
      // ),
      // GoRoute(
      //   path: '/signin',
      //   builder: (BuildContext context, GoRouterState state) => const SignIn(),
      // ),
      // GoRoute(
      //   path: '/admin',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const DashBoard(),
      // ),
    ],
  );
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBarContents(
      backgroundColor: AppColor.primaryColor,
      homeIndex: 5,
      extendBody: true,
      child: Center(
        child: Text(
          '404 PAGE NOT FOUND, CHECK IF THERE IS ERROR AND TRY AGAIN.',
          //error.toString(),
          style: style.copyWith(
            color: AppColor.white.withOpacity(0.8),
            fontSize: 18,
            wordSpacing: 2,
          ),
        ),
      ),
    );
  }
}
