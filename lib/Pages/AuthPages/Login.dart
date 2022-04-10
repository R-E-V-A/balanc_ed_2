import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
// import 'package:resolvers/Services/PostServices.dart';
import 'package:responsive_builder/responsive_builder.dart';

// import '../../../Routes.dart';
import './Components/SignUpTextFieldMobile.dart';
import './Components/SignUpTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isVisible = false;

  // PostServices postServices = PostServices();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: 0.08 * height, left: 0.1 * width, right: 0.1 * width),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 60.0, right: 60),
                  child: Image(
                    height: 80,
                    image: AssetImage("assets/images/balance_ed_horizontal_logo.png"),
                  ),
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                Text(
                  "Welcome Back",
                  style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Color(0xff49494f)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 0.1 * height,
                ),
                SizedBox(
                  height: 0.02 * height,
                ),
                Text(
                  "Email or Username",
                  style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff49494f)),
                ),
                SizedBox(
                  height: 0.01 * height,
                ),
                SignUpTextFieldMobile(
                  width: width,
                  height: height,
                  controller: username,
                  title: "PickleRick007",
                ),
                SizedBox(
                  height: 0.02 * height,
                ),
                Text(
                  "Password",
                  style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff49494f)),
                ),
                SizedBox(
                  height: 0.01 * height,
                ),
                Container(
                  // height: 10,
                  height: height * 0.055,
                  width: 0.8 * width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffD2D8CF)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 3),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            obscureText: isVisible,
                            controller: password,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color(0xff979797), fontSize: 14),
                              border: InputBorder.none,
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Password is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = isVisible ? false : true;
                              });
                            },
                            icon: Icon(!isVisible
                                ? Icons.lock_open_sharp
                                : Icons.lock))
                      ],
                    ),
                  ),
                ),
                // SignUpTextFieldMobile(width: width,height: height,controller: password,title: "Shhh",privacy: 1,),
                SizedBox(
                  height: 0.17 * height,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentContext != null &&
                        formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // var x = await postServices.LogInUser(
                      //     username.text, password.text);
                      //
                      // if (x != null) {
                      //   Navigator.of(context)
                      //       .pushNamedAndRemoveUntil('/HomePage', (Route<
                      //       dynamic> route) => false);
                      // }
                    }
                  },
                  child: Container(
                    height: 0.07 * height,
                    width: width * 0.8,
                    margin: const EdgeInsets.only(bottom: 6.0),
                    //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff22319e)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: paraText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * height,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.SignUpPage);
                  },
                  child: Container(
                    height: 0.07 * height,
                    width: width * 0.8,
                    margin: const EdgeInsets.only(bottom: 6.0),
                    //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff121032)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Create a New Account",
                            style: paraText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
