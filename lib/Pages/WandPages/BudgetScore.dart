import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';

class BudgetScore extends StatefulWidget {
  const BudgetScore({Key? key}) : super(key: key);

  @override
  _BudgetScoreState createState() => _BudgetScoreState();
}

class _BudgetScoreState extends State<BudgetScore> {
  int touchedIndex = -1;

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
                    "Budget Score",
                    style: paraText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 0.07 * height,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.35),
                    child: Text(
                      "6/10",
                      style: paraText.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 0.06 * height,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.27),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: PieChart(PieChartData(
                          pieTouchData: PieTouchData(touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections())),
                    ),
                  ),
                  SizedBox(
                    height: 0.08 * height,
                  ),
                  Text(
                    "What is Budget.ai Score?",
                    style: paraText.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(
                    "a",
                    style: paraText.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 0.04 * height,
                  ),
                  Text(
                    "How does it work?",
                    style: paraText.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(
                    "ab",
                    style: paraText.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xff7165e3),
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
                      '/analyticsPage', (Route<dynamic> route) => false);
                } else if (val == 2) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/BudgetScorePage', (Route<dynamic> route) => false);
                } else if (val == 4) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/MyProfilePage', (Route<dynamic> route) => false);
                }
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                label: " ", icon: Icon(Icons.account_balance_wallet_outlined)),
            BottomNavigationBarItem(label: " ", icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(
                label: " ",
                icon: Stack(
                  children: [
                    Image.asset(
                      "assets/purplenavy.png",
                      height: 50,
                    ),
                    Positioned(
                        top: 13,
                        left: 13,
                        child: Image.asset(
                          "assets/wand.png",
                          height: 25,
                        ))
                  ],
                )),
            BottomNavigationBarItem(
                label: " ", icon: Icon(Icons.sticky_note_2_rounded)),
            BottomNavigationBarItem(label: " ", icon: Icon(Icons.person)),
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
