import 'package:chat_app/chatscreen.dart';
import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Chat App")),
        ),
        body: Chatscreen());
  }
}
