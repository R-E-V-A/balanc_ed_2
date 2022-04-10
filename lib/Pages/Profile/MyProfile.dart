import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Models/UserProfileModel.dart';
import 'package:balanc_ed_2/Pages/AuthPages/Components/SignUpTextField.dart';
import 'package:balanc_ed_2/Pages/Profile/Bookmarks.dart';
import 'package:balanc_ed_2/Pages/Profile/EditProfilePage.dart';
import 'package:balanc_ed_2/Pages/Profile/SoloGoals.dart';
import 'package:balanc_ed_2/Services/GetServices.dart';
import 'package:balanc_ed_2/Services/PostServices.dart';
import 'package:balanc_ed_2/Services/SharedPreferences.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:balanc_ed_2/Routes.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late String token;
  int touchedIndex = -1;
  PageController pageController = PageController(
//    initialPage: 0,
    keepPage: true,
  );

  // final _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
              left: 0.06 * width, right: 0.04 * width, top: 0.06 * height),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: paraText.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 34,
                            color: Color(0xff1c2031)),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()));
                          },
                          icon: Icon(
                            Icons.settings,
                            size: 40,
                            color: Color(0xff200e32),
                          ))
                    ],
                  ),
                  Divider(
                    endIndent: 300,
                    thickness: 4,
                    color: Color(0xff22319e),
                  ),
                  SizedBox(
                    height: 0.001 * height,
                  ),
                  FutureBuilder<UserProfile?>(
                      future: GetServices().getUserProfile(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              CircleAvatar(
                                radius: 90,
                                backgroundImage: AssetImage(
                                  "assets/profilepic.png",
                                ),
                              ),
                              Center(
                                  child: Text(
                                snapshot.data?.username ?? "",
                                style: paraText.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 35),
                              )),
                              Center(
                                  child: Text(snapshot.data?.email ?? "",
                                      style: paraText.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff979797),
                                          fontSize: 18))),
                              SizedBox(
                                height: 0.03 * height,
                              ),
                              Card(
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 20,
                                child: Container(
                                  width: 0.8 * width,
                                  height: 0.13 * height,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Total Lessons Completed",
                                                style: paraText.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 11),
                                              ),
                                              Text("10",
                                                  style: paraText.copyWith(
                                                      color: Color(0xff22319e),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18)),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("Total Amount Saved",
                                                  style: paraText.copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11)),
                                              Text("${200}",
                                                  style: paraText.copyWith(
                                                      color: Color(0xff22319e),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18)),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("Total Goals Completed",
                                                  style: paraText.copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11)),
                                              Text("26",
                                                  style: paraText.copyWith(
                                                      color: Color(0xff22319e),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18)),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Color(0xff22319e),
                                elevation: 20,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Bookmarks",
                                              style: paraText.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25),
                                            ),
                                            SizedBox(
                                              height: 0.01 * height,
                                            ),
                                            Text(
                                              "Take some time to read your saved Shots",
                                              style: paraText.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          width: 40,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          child: Icon(Icons.arrow_forward),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookmarksScreen()));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Card(
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 10,
                                  child: Container(
                                    width: 0.8 * width,
                                    height: 0.3 * height,
                                    child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Goals",
                                                    style: paraText.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                        fontSize: 25)),
                                                Icon(Icons.arrow_forward)
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: PieChart(
                                                        PieChartData(
                                                            pieTouchData: PieTouchData(
                                                                touchCallback:
                                                                    (FlTouchEvent
                                                                            event,
                                                                        pieTouchResponse) {
                                                              setState(() {
                                                                if (!event
                                                                        .isInterestedForInteractions ||
                                                                    pieTouchResponse ==
                                                                        null ||
                                                                    pieTouchResponse
                                                                            .touchedSection ==
                                                                        null) {
                                                                  touchedIndex =
                                                                      -1;
                                                                  return;
                                                                }
                                                                touchedIndex =
                                                                    pieTouchResponse
                                                                        .touchedSection!
                                                                        .touchedSectionIndex;
                                                              });
                                                            }),
                                                            borderData:
                                                                FlBorderData(
                                                              show: false,
                                                            ),
                                                            sectionsSpace: 0,
                                                            centerSpaceRadius:
                                                                20,
                                                            sections:
                                                                showingSections())),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Daily",
                                                            style: paraText.copyWith(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            height: 25,
                                                            child:
                                                                FAProgressBar(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              currentValue: 70,
                                                              displayText: "%",
                                                              displayTextStyle:
                                                                  paraText.copyWith(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xfff1f1f1),
                                                              progressColor:
                                                                  Colors.green,
                                                            ),
                                                          )
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                      SizedBox(
                                                        height: 0.02 * height,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Weekly",
                                                            style: paraText.copyWith(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            height: 25,
                                                            child:
                                                                FAProgressBar(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              currentValue: 50,
                                                              displayText: "%",
                                                              displayTextStyle:
                                                                  paraText.copyWith(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xfff1f1f1),
                                                              progressColor:
                                                                  Color(
                                                                      0xff0d34ff),
                                                            ),
                                                          )
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                      SizedBox(
                                                        height: 0.02 * height,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Monthly",
                                                            style: paraText.copyWith(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            height: 25,
                                                            child:
                                                                FAProgressBar(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              currentValue: 90,
                                                              displayText: "%",
                                                              displayTextStyle:
                                                                  paraText.copyWith(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xfff1f1f1),
                                                              progressColor:
                                                                  Colors.orange,
                                                            ),
                                                          )
                                                        ],
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SoloGoalpage()));
                                },
                              ),
                              SizedBox(
                                height: 0.03 * height,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await deleteLocalKey("token1");
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/LogInPage',
                                      (Route<dynamic> route) => false);
                                },
                                child: Container(
                                  height: 0.07 * height,
                                  width: width * 0.8,
                                  margin: const EdgeInsets.only(bottom: 6.0),
                                  //Same as `blurRadius` i guess
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xff200e32)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Log Out",
                                          style: paraText.copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 0.02 * width,
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt,
                                          color: Colors.white,
                                          size: 30,
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                              /*GestureDetector(
                                onTap: ()async{
                                  await deleteLocalKey("token1");
                                  Navigator.of(context)
                                      .pushNamedAndRemoveUntil('/LogInPage', (Route<dynamic> route) => false);
                                },
                                child: Container(
                                  height: 0.07*height,
                                  width: width*0.8,
                                  margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.red,
                                          Colors.redAccent
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Log Out",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          width: 0.02*width,
                                        ),
                                        Icon(Icons.arrow_right_alt,color: Colors.white,size: 30,)
                                      ],
                                    )),
                                  ),
                                ),
                              ),*/
                            ],
                          );
                        }
                        return Center(
                          child: Text("Hang On, Fetching your info"),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          currentIndex: currIndex,
          elevation: 20,
          onTap: (val) {
            setState(() {
              if (val != currIndex) {
                currIndex = val;
                if (val == 0) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/HomePage', (Route<dynamic> route) => false);
                }
                /*else if (val == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/BudgetHomePage', (Route<dynamic> route) => false);
                } */
                else if (val == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/MyProfilePage', (Route<dynamic> route) => false);
                }
              }
            });
          },
          selectedIconTheme: IconThemeData(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            /*   BottomNavigationBarItem(
                label: "Budget",
                icon: Icon(Icons.account_balance_wallet_outlined)),*/
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
        ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0d34ff),
            value: 60,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xffeeeeee),
            value: 40,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
