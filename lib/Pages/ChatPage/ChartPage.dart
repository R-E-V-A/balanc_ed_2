import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final _formKey = GlobalKey<FormState>();

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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
            Expanded(child: Container()),
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
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {}
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
