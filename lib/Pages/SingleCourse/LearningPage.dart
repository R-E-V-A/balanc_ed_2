import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Services/TwilioServices.dart';
import 'package:flutter_tts/flutter_tts.dart';

// import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:video_player/video_player.dart';

import '../../Constants/Fonts&Themes.dart';

class LearningPage extends StatefulWidget {
  final String titleText;

  LearningPage({Key? key, required this.titleText}) : super(key: key);

  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  bool isSpeaking = false;
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();
  TwilioService twilioService = TwilioService();

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeTts();
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void speak() async {
    if (contentDummy.isNotEmpty) {
      await _flutterTts.speak(contentDummy.substring(0, 1000));
    }
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  List<IconData> icons = [
    Icons.ac_unit,
    Icons.account_balance,
    Icons.adb,
    Icons.add_photo_alternate,
    Icons.format_line_spacing
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // blurBackground: true,
        // scrollDirection: Axis.vertical,
        // expansionExtent: 1.0,
        // backgroundWidget: Padding(
        //   padding: EdgeInsets.only(
        //       top: 0.05 * height, left: 0.07 * width, right: 0.07 * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lesson 1",
                      style: paraText.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.titleText,
                      style: paraText.copyWith(
                          color: Color(0xff979797),
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  width: 0.32 * width,
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      isSpeaking ? Icons.volume_off : Icons.volume_up,
                      size: 35,
                    ),
                    color: Colors.black,
                    onPressed: () async {
                      await isSpeaking ? stop() : speak();
                    },
                  ),
                ),
                SizedBox(
                  width: 0.032 * width,
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 35,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
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
                    image: AssetImage("assets/learning.png"),
                  )),
            ),
            SizedBox(
              height: 0.04 * height,
            ),
            Text(
              "Budgeting can help you optimize your shopping decisions upto 25%",
              style: paraText.copyWith(
                  color: Color(0xff1c2031),
                  fontSize: 27,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ipsum phasellus diam eu mi, elementum. Pellentesque dapibus nisi auctor vitae ut congue facilisis metus.",
              style: paraText.copyWith(color: Color(0xff9c9c9c), fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 0.02 * height,
            ),
          ],
        ),
      ),
      // expandedChild: Container(
      //   color: Color(0xff22319e),
      //   child: Padding(
      //     padding: EdgeInsets.only(
      //         top: 0.02 * height,
      //         left: 0.07 * width,
      //         right: 0.07 * width,
      //         bottom: 0.02 * height),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Center(
      //               child: Icon(
      //             Icons.keyboard_arrow_down,
      //             color: Colors.white,
      //             size: 40,
      //           )),
      //           SizedBox(
      //             height: 0.02 * height,
      //           ),
      //           Center(
      //               child: Text(
      //             "Swipe Down to Go Back",
      //             style: reva.copyWith(
      //                 fontWeight: FontWeight.w600, fontSize: 14),
      //           )),
      //           SizedBox(
      //             height: 0.04 * height,
      //           ),
      //           Text(
      //             "Concept Video",
      //             style: reva.copyWith(
      //                 fontWeight: FontWeight.w600, fontSize: 24),
      //           ),
      //           SizedBox(
      //             height: 0.01 * height,
      //           ),
      //           Stack(
      //             children: [
      //               Center(
      //                 child: controller.value.isInitialized
      //                     ? AspectRatio(
      //                         aspectRatio: controller.value.aspectRatio,
      //                         child: VideoPlayer(controller),
      //                       )
      //                     : Container(),
      //               ),
      //               Positioned(
      //                 top: 70,
      //                 left: width * 0.37,
      //                 child: Center(
      //                   child: IconButton(
      //                     icon: Icon(
      //                       controller.value.isPlaying
      //                           ? null
      //                           : Icons.play_arrow,
      //                       color: Colors.white,
      //                       size: 40,
      //                     ),
      //                     onPressed: () {
      //                       setState(() {
      //                         controller.value.isPlaying
      //                             ? controller.pause()
      //                             : controller.play();
      //                       });
      //                     },
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 0.04 * height,
      //           ),
      //           Text(
      //             "Breakdown",
      //             style: reva.copyWith(
      //                 fontWeight: FontWeight.w600, fontSize: 24),
      //           ),
      //           SizedBox(
      //             height: 0.02 * height,
      //           ),
      //           Text(
      //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolor ipsum phasellus diam eu mi, elementum. Pellentesque dapibus nisi auctor vitae ut congue facilisis metus.",
      //             style: paraText.copyWith(color: Colors.white, fontSize: 15),
      //             textAlign: TextAlign.start,
      //           ),
      //           SizedBox(
      //             height: 0.02 * height,
      //           ),
      //           Text(
      //             "Additional Reading",
      //             style: reva.copyWith(
      //                 fontWeight: FontWeight.w600, fontSize: 24),
      //           ),
      //           Row(
      //             children: [
      //               Expanded(
      //                 child: Container(
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Image(
      //                         image: AssetImage("assets/calculator.png"),
      //                         height: 80,
      //                       ),
      //                       Text(
      //                         "How to use a calculator for Budgeting!",
      //                         style: reva.copyWith(
      //                             fontWeight: FontWeight.w700, fontSize: 17),
      //                       ),
      //                       SizedBox(
      //                         height: 0.01 * height,
      //                       ),
      //                       Text(
      //                         "2 Min. Money Magazine",
      //                         style: reva.copyWith(
      //                             fontWeight: FontWeight.w600, fontSize: 10),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Image(
      //                         image: AssetImage("assets/calculator.png"),
      //                         height: 80,
      //                       ),
      //                       Text(
      //                         "How to use a calculator for Budgeting!",
      //                         style: reva.copyWith(
      //                             fontWeight: FontWeight.w700, fontSize: 17),
      //                       ),
      //                       SizedBox(
      //                         height: 0.01 * height,
      //                       ),
      //                       Text(
      //                         "2 Min. Money Magazine",
      //                         style: reva.copyWith(
      //                             fontWeight: FontWeight.w600, fontSize: 10),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 0.02 * height,
      //           ),
      //           Text(
      //             "Book Recommendations",
      //             style: reva.copyWith(
      //                 fontWeight: FontWeight.w600, fontSize: 24),
      //           ),
      //           Row(
      //             children: [
      //               Container(
      //                 child: Column(
      //                   children: [
      //                     Container(
      //                       child: Image(
      //                         image: AssetImage("assets/malala.png"),
      //                         height: 130,
      //                       ),
      //                     ),
      //                     Text(
      //                       "I Am Malala",
      //                       style: reva.copyWith(
      //                           fontWeight: FontWeight.w700, fontSize: 17),
      //                     ),
      //                     SizedBox(
      //                       height: 0.01 * height,
      //                     ),
      //                     Text(
      //                       "Malala Yousufzai",
      //                       style: reva.copyWith(
      //                           fontWeight: FontWeight.w600, fontSize: 10),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 0.02 * width,
      //               ),
      //               Container(
      //                 child: Column(
      //                   children: [
      //                     Container(
      //                       child: Image(
      //                         image: AssetImage("assets/educated.png"),
      //                         height: 130,
      //                       ),
      //                     ),
      //                     Text(
      //                       "Educated",
      //                       style: reva.copyWith(
      //                           fontWeight: FontWeight.w700, fontSize: 17),
      //                     ),
      //                     SizedBox(
      //                       height: 0.01 * height,
      //                     ),
      //                     Text(
      //                       "Tara Westover",
      //                       style: reva.copyWith(
      //                           fontWeight: FontWeight.w600, fontSize: 10),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 0.02 * width,
      //               ),
      //               Container(
      //                 child: Column(
      //                   children: [
      //                     Container(
      //                       child: Image(
      //                         image: AssetImage("assets/orphan.png"),
      //                         height: 130,
      //                       ),
      //                     ),
      //                     Text(
      //                       "War and Child",
      //                       style: reva.copyWith(
      //                           fontWeight: FontWeight.w700, fontSize: 17),
      //                     ),
      //                     SizedBox(
      //                       height: 0.01 * height,
      //                     ),
      //                     Text(
      //                       "Molly Green",
      //                       style: reva.copyWith(
      //                           fontWeight: FontWeight.w600, fontSize: 10),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // previewChild: Container(
      //     padding: EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //         color: Color(0xff22319e),
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(30),
      //             topRight: Radius.circular(30))),
      //     child: Center(
      //         child: Text(
      //       "Swipe up to Dig Deeper",
      //       style: reva.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      //     ))),
      // minExtent: 80,
      // maxExtent: MediaQuery.of(context).size.height,
    );
  }
}
