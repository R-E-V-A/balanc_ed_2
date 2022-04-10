import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Pages/ChatPage/components/Message.dart';
import 'package:balanc_ed_2/Services/ChatService.dart';
import 'package:flutter/material.dart';

import '../../Models/ChatModels.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  var messages = List<Message>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 48, left: 24),
              child: Text(
                "Chat",
                style: paraText.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 8.0),
              child: Container(
                width: 30,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Colors.deepPurple))),
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: SingleChildScrollView(
                      child: Column(
                          children: messages
                              .map((e) => MessageComponent(
                                  content: e.content, isSender: e.isSender))
                              .toList()),
                    ))),
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0))),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(32.0))),
                          child: Row(
                            children: [
                              Form(
                                key: _formKey,
                                child: Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: TextFormField(
                                    controller: _questionController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16.0))),
                                    ),
                                  ),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  child: IconButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          messages.add(Message(
                                              isSender: true,
                                              content:
                                                  _questionController.text));
                                          _questionController.text = "";
                                        });
                                        var answer = await sendQuestion(
                                            question: _questionController.text);
                                        setState(() {
                                          messages.add(Message(
                                              isSender: false,
                                              content: answer?.answer ?? ""));
                                        });
                                      }
                                    },
                                    // style: ButtonStyle(
                                    //   backgroundColor:
                                    //       MaterialStateProperty.all<Color>(Colors.blue),
                                    // ),
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3), spreadRadius: 3),
                ],
              ),
              // clipBehavior: ,
              child: Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.home)),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.account_circle))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
