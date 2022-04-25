import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Pages/AuthPages/Components/SignUpTextFieldMobile.dart';
import 'package:balanc_ed_2/Pages/AuthPages/Components/SignUpTextField.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
                "Settings",
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
                height: 0.02 * height,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(
                    "assets/images/profile.png",
                  ),
                ),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Center(
                  child: Text("Change Profile Picture",
                      style: reva.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xff979797)))),
              SizedBox(
                height: 0.02 * height,
              ),
              Text(
                "Change Display Name",
                style: reva.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              SignUpTextFieldMobile(width: width, height: height),
              SizedBox(
                height: 0.02 * height,
              ),
              Text(
                "Change Font Size",
                style: reva.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff22319e)),
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        fsize++;
                      });
                    },
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Text(
                    "${fsize}",
                    style: reva.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 38,
                        color: Color(0xff22319e)),
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff22319e)),
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        fsize--;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 0.15 * height,
              ),
              GestureDetector(
                child: Container(
                  height: 0.08 * height,
                  width: 0.85 * width,
                  margin: const EdgeInsets.only(bottom: 6.0),
                  //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xff22319e),
                  ),
                  child: Center(
                      child: Text(
                    "Save All Changes",
                    style: paraText.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
