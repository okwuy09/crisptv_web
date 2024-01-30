import 'package:crisptv/component/style.dart';
import 'package:crisptv/model/posts.dart';
import 'package:crisptv/service/controller.dart';
import 'package:crisptv/view/authentication/signin.dart';
import 'package:crisptv/view/authentication/signup.dart';
import 'package:crisptv/view/live_session/live_session.dart';
import 'package:crisptv/view/news/news.dart';
import 'package:crisptv/view/post_detail.dart';
import 'package:crisptv/view/search/search.dart';
import 'package:crisptv/view/show/show.dart';
import 'package:crisptv/view/show/video_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'component/color.dart';
import 'firebase_options.dart';
import 'view/dashboard/dashboard.dart';
import 'view/home_page/home_page.dart';
import 'view/topbar.dart';

void main() async {
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
        title: 'Crisptv',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: AppColor.white,
          fontFamily: 'SF Pro Display',
        ),
        // home: const HomePage(),
      ),
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
        routes: <RouteBase>[
          GoRoute(
            path: ':videodetail',
            name: 'video_detail',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              // state.extra; use to pass data to another page
              Posts videoPost = state.extra as Posts;
              return VideoDetail(videopost: videoPost);
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
              Posts newsPost = state.extra as Posts;
              return PostDetail(newsPost: newsPost);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/live-sessions',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const LiveSessions(),
      ),
      GoRoute(
        path: '/search',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchPost(),
      ),
      GoRoute(
        path: '/signup',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) => const SignUp(),
      ),
      GoRoute(
        path: '/admin',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) => const SignIn(),
        redirect: (BuildContext context, GoRouterState state) {
          if (FirebaseAuth.instance.currentUser == null) {
            return '/admin';
          } else {
            return '/dashboard';
          }
        },
      ),
      GoRoute(
        path: '/dashboard',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const DashBoard(),
        redirect: (BuildContext context, GoRouterState state) {
          if (FirebaseAuth.instance.currentUser == null) {
            return '/admin';
          } else {
            return '/dashboard';
          }
        },
      ),
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
