import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Pages/AuthPages/Components/SignUpTextFieldMobile.dart';
import 'package:balanc_ed_2/Services/PostServices.dart';
import 'package:balanc_ed_2/Services/TwilioServices.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../../Routes.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({Key? key}) : super(key: key);

  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  PostServices postServices = PostServices();
  bool isincome = false, isexpense = false, isadding = false;
  int val = 1, val2 = 1;
  TwilioService twilioService = TwilioService();

  void toggleBoolean(int curr) {
    if (curr == 1) {
      if (isincome == false && isexpense == false) {
        isincome = true;
      } else if (isincome == false && isexpense == true) {
        isincome = true;
        isexpense = false;
      } else if (isincome == true && isexpense == false) {
        isincome == false;
      }
    } else if (curr == 2) {
      if (isincome == false && isexpense == false) {
        isexpense = true;
      } else if (isincome == true && isexpense == false) {
        isincome = false;
        isexpense = true;
      } else if (isincome == false && isexpense == true) {
        isexpense = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.05, top: height * 0.05, right: width * 0.05),
        child: Container(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xff39d074),
                        elevation: 20,
                        child: Container(
                          height: 0.055 * height,
                          width: 0.13 * width,
                          margin: const EdgeInsets.only(bottom: 6.0),
                          //Same as `blurRadius` i guess
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                                colors: [Color(0xff68e89a), Color(0xff39d074)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.1 * width,
                    ),
                    Text(
                      "Add a Record",
                      style: paraText.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.04 * height,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      isexpense == false
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      toggleBoolean(1);
                                    });
                                  },
                                  child: Container(
                                    width: 0.2 * width,
                                    height: 0.1 * height,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: isincome
                                            ? Color(0xff39d074)
                                            : Color(0xffd9ffe8)),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_downward_sharp,
                                        color: isincome
                                            ? Colors.white
                                            : Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Add Income",
                                  style: paraText.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black),
                                )
                              ],
                            )
                          : Container(
                              height: 0.055 * height,
                              width: 0.13 * width,
                            ),
                      SizedBox(
                        width: 0.16 * width,
                      ),
                      isincome == false
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      toggleBoolean(2);
                                    });
                                  },
                                  child: Container(
                                    width: 0.2 * width,
                                    height: 0.1 * height,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: isexpense
                                            ? Color(0xffb1060f)
                                            : Color(0xffffe5e6)),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_upward_sharp,
                                        color: isexpense
                                            ? Colors.white
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Add Expense",
                                  style: paraText.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black),
                                )
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.04 * height,
                ),
                isincome == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 0.05 * width,
                          ),
                          Text(
                            "Title",
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
                            controller: title,
                            title: "Rick Sanchez",
                          ),
                          SizedBox(
                            height: 0.02 * height,
                          ),
                          Text(
                            "Recieved On",
                            style: paraText.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff49494f)),
                          ),
                          SizedBox(
                            height: 0.01 * height,
                          ),
                          DateTimeBox(
                            width: width,
                            height: height,
                            controller: date,
                            title: "29/02/2000",
                          ),
                          SizedBox(
                            height: 0.02 * height,
                          ),
                          Text(
                            "Amount",
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
                            controller: amount,
                            title: "Wakanda",
                          ),
                          SizedBox(
                            height: 0.01 * height,
                          ),
                          Text(
                            "Category",
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
                            controller: category,
                            title: "Stocks",
                          ),
                          SizedBox(
                            height: 0.10 * height,
                          ),
                          GestureDetector(
                              onTap: () async {
                                Fluttertoast.showToast(msg: "Hang On");
                                int amt = int.parse(amount.text);
                                await postServices.addTransaction(
                                    date.text, amt, title.text, " ", "Income");
                                twilioService.setAccount();
                                twilioService.sendSms();
                                // Navigator.pushNamed(
                                //     context, Routes.budgetHomePage);
                              },
                              child: Container(
                                height: 0.07 * height,
                                width: width * 0.9,
                                margin: const EdgeInsets.only(bottom: 6.0),
                                //Same as `blurRadius` i guess
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xff68e89a),
                                        Color(0xff39d074)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 0.02 * width,
                                      ),
                                      Text(
                                        "Add",
                                        style: paraText.copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                                ),
                              )),
                        ],
                      )
                    : isexpense == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 0.05 * width,
                              ),
                              Text(
                                "Expense Type",
                                style: paraText.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff49494f)),
                              ),
                              SizedBox(
                                height: 0.01 * height,
                              ),
                              Container(
                                height: height * 0.055,
                                width: 0.8 * width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xffD2D8CF)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        elevation: 0,
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                        value: val,
                                        onChanged: (x) {
                                          setState(() {
                                            val = int.parse(x.toString());
                                          });
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            value: 1,
                                            child: Text("General"),
                                          ),
                                          DropdownMenuItem(
                                            value: 2,
                                            child: Text("Membership"),
                                          ),
                                          DropdownMenuItem(
                                            value: 3,
                                            child: Text("Debt"),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                              val == 3
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 0.02 * height,
                                        ),
                                        Text(
                                          "Sub Category",
                                          style: paraText.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color(0xff49494f)),
                                        ),
                                        SizedBox(
                                          height: 0.01 * height,
                                        ),
                                        Container(
                                          height: height * 0.055,
                                          width: 0.8 * width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xffD2D8CF)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                  elevation: 0,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  isExpanded: true,
                                                  value: val2,
                                                  onChanged: (x) {
                                                    setState(() {
                                                      val2 = int.parse(
                                                          x.toString());
                                                    });
                                                  },
                                                  items: [
                                                    DropdownMenuItem(
                                                      value: 1,
                                                      child: Text(
                                                          "Interest or Loan"),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 2,
                                                      child: Text("Type 2"),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 3,
                                                      child: Text("Type 3"),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 0.02 * height,
                              ),
                              Text(
                                "Title",
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
                                controller: category,
                                title: "Rick Sanchez",
                              ),
                              SizedBox(
                                height: 0.02 * height,
                              ),
                              Text(
                                "Spent On",
                                style: paraText.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff49494f)),
                              ),
                              SizedBox(
                                height: 0.01 * height,
                              ),
                              DateTimeBox(
                                width: width,
                                height: height,
                                controller: date,
                                title: "29/02/2000",
                              ),
                              SizedBox(
                                height: 0.02 * height,
                              ),
                              Text(
                                "Amount",
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
                                controller: amount,
                                title: "Wakanda",
                              ),
                              SizedBox(
                                height: 0.10 * height,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Fluttertoast.showToast(msg: "Hang On");
                                  int amt = int.parse(amount.text);
                                  await postServices.addTransaction(date.text,
                                      amt, category.text, " ", "Expense");
                                  twilioService.sendSms();
                                  // Navigator.pushNamed(
                                  //     context, Routes.budgetHomePage);
                                },
                                child: Container(
                                  height: 0.07 * height,
                                  width: width * 0.9,
                                  margin: const EdgeInsets.only(bottom: 6.0),
                                  //Same as `blurRadius` i guess
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff68e89a),
                                          Color(0xff39d074)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          width: 0.02 * width,
                                        ),
                                        Text(
                                          "Add",
                                          style: paraText.copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
