import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key, required String image, required String name})
      : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: kPrimaryColor,
        leading: BackButton(
          color: kBackgroundColor,
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            CircleAvatar(
              radius: 24,
              //backgroundImage: AssetImage(),
            )
          ],
        ),
      ),
    );
  }
}
