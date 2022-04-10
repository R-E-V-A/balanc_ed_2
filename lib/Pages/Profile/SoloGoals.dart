import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';

class SoloGoalpage extends StatefulWidget {
  const SoloGoalpage({Key? key}) : super(key: key);

  @override
  _SoloGoalpageState createState() => _SoloGoalpageState();
}

class _SoloGoalpageState extends State<SoloGoalpage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(
              left: 0.06 * width, right: 0.04 * width, top: 0.06 * height),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Goals",
                    style: paraText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 34,
                        color: Color(0xff1c2031)),
                  ),
                  Divider(
                    endIndent: 300,
                    thickness: 4,
                    color: Color(0xff22319e),
                  ),
                  SizedBox(
                    height: 0.03 * height,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  goalList[index],
                                  style: paraText.copyWith(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 0.01 * height,
                                ),
                                Container(
                                  width: 260,
                                  height: 25,
                                  child: FAProgressBar(
                                    borderRadius: BorderRadius.circular(10),
                                    currentValue: 17 * (index + 1),
                                    displayText: "%",
                                    displayTextStyle: paraText.copyWith(
                                        fontSize: 12, color: Colors.white),
                                    backgroundColor: Color(0xfff1f1f1),
                                    progressColor: Color(0xff0d34ff),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.03 * height,
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            SizedBox(
                              width: 0.03 * width,
                            ),
                            Container(
                              width: 70,
                              height: 50,
                              child: Icon(
                                Icons.verified_outlined,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffe5e5e5),
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        ),
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                  )
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
                } else if (val == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/BudgetHomePage', (Route<dynamic> route) => false);
                } else if (val == 2) {
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
            BottomNavigationBarItem(
                label: "Budget",
                icon: Icon(Icons.account_balance_wallet_outlined)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
        ));
  }
}
