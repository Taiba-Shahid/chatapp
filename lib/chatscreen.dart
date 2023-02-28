import 'package:chat_app/chatmassage.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final TextEditingController _textcontroller = TextEditingController();
  final List<Chatmessage> _message = <Chatmessage>[];
  void _handlesubmitted(String text) {
    _textcontroller.clear();
    Chatmessage message = Chatmessage(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _chatcomposer() {
    return IconTheme(
      data: const IconThemeData(color: Colors.cyan),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Flexible(
            child: TextField(
              decoration:
                  const InputDecoration.collapsed(hintText: "Enter a message"),
              controller: _textcontroller,
              onSubmitted: _handlesubmitted,
            ),
          ),
          Container(
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: (() {
                _handlesubmitted(_textcontroller.text);
              }),
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: ListView.builder(
          itemBuilder: (_, int index) => _message[index],
          itemCount: _message.length,
        )),
        const Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _chatcomposer(),
        )
      ],
    );
  }
}
