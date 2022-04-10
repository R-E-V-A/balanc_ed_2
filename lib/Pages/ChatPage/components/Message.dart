import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:flutter/material.dart';

class MessageComponent extends StatefulWidget {
  late bool isSender;
  late String content;

  MessageComponent({Key? key, required this.content, required this.isSender})
      : super(key: key);

  @override
  State<MessageComponent> createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
                color: widget.isSender
                    ? const Color.fromRGBO(207, 215, 242, 1)
                    : const Color.fromRGBO(235, 235, 235, 1),
                borderRadius: const BorderRadius.all(Radius.circular(16.0))),
            child: Text(
              widget.content,
              textAlign: widget.isSender ? TextAlign.end : TextAlign.start,
              style: paraText.copyWith(color: Colors.black),
            ),
          )
        ],
        mainAxisAlignment:
            widget.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      ),
    );
  }
}
