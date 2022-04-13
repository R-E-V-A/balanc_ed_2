import 'package:balanc_ed_2/Pages/ChatPage/ChatPage.dart';
import 'package:balanc_ed_2/Pages/Profile/MyProfile.dart';
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
import 'Pages/WandPages/BudgetScore.dart';

import 'package:balanc_ed_2/Routes.dart';

void main() {
  runApp(SplashScreen());
}

var routes = <String, WidgetBuilder>{
  Routes.SignUpPage: (BuildContext context) => SignUpPage(),
  Routes.LogInPage: (BuildContext context) => LoginPage(),
  Routes.MyProfilePage: (BuildContext context) => MyProfile(),
  Routes.HomePage: (BuildContext context) => HomePage(),
  Routes.splashPage: (BuildContext context) => SplashScreen(),
  Routes.aboutPage: (BuildContext context) => AboutPage(),
  Routes.budgetScorePage: (BuildContext context) => BudgetScore(),
  Routes.budgetHomePage: (BuildContext context) => BudgetHome(),
  Routes.splashPage: (BuildContext context) => SplashScreen()
};

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
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: "GoRouter Example",
      // debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const ChatPage(),
      // home: SignUpPage(title: "Signup page")
      // home: const LoginPage()
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingPage()),
    GoRoute(
      path: "/home",
      builder: (BuildContext context, GoRouterState state) => const HomePage()
    ),
    GoRoute(
        path: "/profile",
        builder: (BuildContext context, GoRouterState state) => const MyProfile()
    )
  ]);
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class OnBoardingPage {
  String title, subtitle, image;

  OnBoardingPage(this.title, this.subtitle, this.image);
}

class _OnboardingPageState extends State<OnboardingPage> {
  OnBoardingPage getOnBoardingData(int index) {
    var onBoardingDataList = [
      OnBoardingPage(
          "Start your journey with fun learning content",
          "explore various learning videos\n based on your passion",
          "assets/images/onboarding_1.png"),
      OnBoardingPage(
          "Start your journey with fun learning content",
          "explore various learning videos\n based on your passion",
          "assets/images/onboarding_2.png"),
      OnBoardingPage(
          "Start your journey with fun learning content",
          "explore various learning videos\n based on your passion",
          "assets/images/onboarding_3.png")
    ];
    return onBoardingDataList[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: [1, 2, 3].map((i) {
              var carouselData = getOnBoardingData(i - 1);
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(carouselData.image),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              carouselData.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            carouselData.subtitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ));
                },
              );
            }).toList(),
          ),
        ],
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: TextButton(
                  onPressed: () {
                    context.go("/home");
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepPurple)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ]));
  }
}
