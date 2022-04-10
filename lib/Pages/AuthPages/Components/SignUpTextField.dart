import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpTextField extends StatefulWidget {
  SignUpTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    required this.title,
    this.privacy,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final double width;
  final double height;
  int? privacy;

  @override
  _SignUpTextFieldState createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  bool hide = false;

  void toggle() {
    setState(() {
      hide = !hide;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        // height: 10,
        height: 85,
        width: 0.3 * widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffD2D8CF)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: widget.privacy == 1 ? hide : false,
                  controller: widget.controller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: widget.privacy == 2 ? widget.title : ""),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return '${widget.title} is empty';
                    }
                    return null;
                  },
                  focusNode: widget.privacy == 2
                      ? new AlwaysDisabledFocusNode()
                      : null,
                ),
              ),
              widget.privacy == 1
                  ? IconButton(
                      onPressed: () {
                        toggle();
                      },
                      icon: Icon(hide
                          ? FontAwesomeIcons.lock
                          : FontAwesomeIcons.unlock))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
