import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 0.06 * width, right: 0.04 * width, top: 0.08 * height),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(40),
                        color: Color(0xff22319e)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.03 * width,
                  ),
                  Text(
                    "Back",
                    style: reva.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Text(
                "Bookmarks",
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
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            title: Text(
                              "Microsoft Stocks are going down after launch of New Surface Pro",
                              style: reva.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            trailing: Image(
                              image: AssetImage("assets/bookmark.png"),
                              height: 40,
                            )),
                        Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
