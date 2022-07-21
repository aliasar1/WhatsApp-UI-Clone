import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.image, required this.name, required this.status})
      : super(key: key);
  final String image, name;
  final bool status;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 75,
        titleSpacing: 5,
        backgroundColor: kPrimaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kSmallPadding * 0.5),
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.image),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 16,
                color: kBackgroundColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                widget.status == true ? "active" : "last seen today at 3:31 pm",
                style: const TextStyle(color: kBackgroundColor, fontSize: 12),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_off_rounded, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call_rounded, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 24),
          ),
        ],
      ),
    );
  }
}
