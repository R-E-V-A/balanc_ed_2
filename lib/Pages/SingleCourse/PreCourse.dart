import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';

import 'PostCourse.dart';

class PreCourse extends StatefulWidget {
  final String titleText;

  PreCourse({Key? key, required this.titleText}) : super(key: key);

  @override
  _PreCourseState createState() => _PreCourseState();
}

class _PreCourseState extends State<PreCourse> {
  var demoText = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      body: Padding(
        padding: EdgeInsets.only(
            top: 0.05 * height, left: 0.07 * width, right: 0.07 * width),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff22319e),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 5.0, top: 5, bottom: 5),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.03 * width,
                      ),
                      Text(
                        "Back",
                        style: paraText.copyWith(
                            color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0.04 * height,
                  ),
                  Container(
                    width: 0.95 * width,
                    height: 0.2 * height,
                    decoration: BoxDecoration(
                        color: Color(0xfff2ebe8),
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/images/prenroll.png"),
                        )),
                  ),
                  SizedBox(
                    height: 0.04 * height,
                  ),
                  Text(
                    widget.titleText,
                    style: paraText.copyWith(
                        color: Color(0xff1c2031),
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(
                    "Learn to budget your expenses.",
                    style: paraText.copyWith(
                      color: Color(0xff9c9c9c),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Text("Why you should take this course?",
                      style: paraText.copyWith(
                          color: Color(0xff1c2031),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(demoText,
                      style: paraText.copyWith(
                          color: Color(0xff9c9c9c), fontSize: 15)),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Text("What Will you Learn",
                      style: paraText.copyWith(
                          color: Color(0xff1c2031),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ipsum phasellus diam eu mi, elementum. Pellentesque dapibus nisi auctor vitae ut congue facilisis metus. Praesent libero facilisi eleifend justo, tortor suscipit. Fringilla pharetra nibh tortor nunc nisl dictum suscipit convallis donec. Penatibus ut lacus nullam orci ut sit.",
                      style: paraText.copyWith(
                          color: Color(0xff9c9c9c), fontSize: 15)),
                ],
              ),
            ),
            Positioned(
              bottom: height * 0.01,
              left: 0.02 * width,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostCourse(
                          titleText: widget.titleText,
                        ),
                      ));
                },
                child: Container(
                  height: 0.08 * height,
                  width: 0.75 * width,
                  margin: const EdgeInsets.only(bottom: 6.0),
                  //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xff22319e),
                  ),
                  child: Center(
                      child: Text(
                    "Enroll this course",
                    style: paraText.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
