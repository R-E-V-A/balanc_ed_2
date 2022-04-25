import 'package:balanc_ed_2/Pages/ChatPage/ChatPage.dart';
import 'package:balanc_ed_2/Pages/Profile/Bookmarks.dart';
import 'package:balanc_ed_2/Pages/Profile/EditProfilePage.dart';
import 'package:balanc_ed_2/Pages/Profile/MyProfile.dart';
import 'package:balanc_ed_2/Pages/SingleCourse/LearningPage.dart';
import 'package:balanc_ed_2/Pages/SingleCourse/PreCourse.dart';
import 'package:balanc_ed_2/Pages/StoryPage.dart';
import 'package:balanc_ed_2/Routes.dart';
import 'package:balanc_ed_2/Services/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:go_router/go_router.dart';

import 'Pages/AuthPages/AboutPage.dart';
import 'Pages/AuthPages/Login.dart';
import 'Pages/AuthPages/Signup.dart';
import 'Pages/BudgetDiary/BudgetHome.dart';
import 'Pages/Home/Homepage.dart';
import 'Pages/OnboardingPage.dart';
import 'Pages/WandPages/BudgetScore.dart';

import 'package:balanc_ed_2/Routes.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  String? token = "";

  loadData() async {
    token = await getToken(key: "token1");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: "GoRouter Example",
    );
  }

  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingPage()),
    GoRoute(
        path: "/home",
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage()),
    GoRoute(
        path: "/home/storypage",
        builder: (BuildContext context, state) {
          var _idx = state.queryParams["index"];
          var _news = state.queryParams["news"];
          return StoryPage(
            news: _news as dynamic,
            idx: _idx as int,
          );
        }),
    GoRoute(
        path: "/profile",
        builder: (BuildContext context, GoRouterState state) =>
            const MyProfile()),
    GoRoute(
        path: "/profile/edit",
        builder: (BuildContext context, GoRouterState state) =>
            const EditProfilePage()),
    GoRoute(
        path: "/profile/bookmarks",
        builder: (BuildContext context, GoRouterState state) =>
            const BookmarksScreen()),
    GoRoute(
        path: "/learning-page",
        builder: (BuildContext context, GoRouterState state) =>
            LearningPage(titleText: "Some title")),
    GoRoute(
        path: "/precourse",
        builder: (BuildContext context, state) {
          var _title = state.queryParams["title"];
          return PreCourse(titleText: _title!);
        }),
  ]);
}
