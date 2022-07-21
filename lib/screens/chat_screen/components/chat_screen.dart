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
                fontSize: 17,
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
                widget.status == true ? "online" : "last seen today at 3:31 pm",
                style: const TextStyle(color: kBackgroundColor, fontSize: 13),
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgorund.png'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: chatMessagesData.length,
              itemBuilder: ((context, index) => ChatMessageCard(
                    message: chatMessagesData[index],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: kMedPadding,
              right: kMedPadding * 0.8,
              left: kMedPadding * 0.8),
          decoration: BoxDecoration(
            color:
                message.isSender ? kReceiverMessageColor : kSenderMessageColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 80, top: 5, bottom: 20),
                child: Text(
                  message.text,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      message.time,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: message.isSender
                          ? const Icon(
                              Icons.done_all,
                              size: 18,
                              color: kReceivedColor,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
