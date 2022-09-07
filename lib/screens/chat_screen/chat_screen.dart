import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/chat.dart';
import 'package:whatsapp_clone/screens/chat_screen/components/chat_body.dart';
import 'package:whatsapp_clone/screens/info_screen/info_screen.dart';

import '../caller_screen/caller_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.status,
      required this.chat})
      : super(key: key);
  final String image, name;
  final Chat chat;
  final bool status;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            opacity: isDarkMode ? 0.32 : 1,
            image: isDarkMode
                ? const AssetImage('assets/images/dark background.png')
                : const AssetImage('assets/images/backgorund.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          leadingWidth: 75,
          titleSpacing: 5,
          backgroundColor: isDarkMode ? kBlackShadowBgColor : kPrimaryColor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kSmallPadding * 0.5),
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
          title: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(chat: widget.chat),
                ),
              );
            },
            child: Column(
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
                    widget.status == true
                        ? "online"
                        : "last seen today at 3:31 pm",
                    style:
                        const TextStyle(color: kBackgroundColor, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallerScreen(
                              image: widget.image,
                              name: widget.name,
                              status: widget.chat.isActive == true
                                  ? "Available"
                                  : "Unavailable",
                            )));
              },
              icon: const Icon(Icons.videocam_rounded, size: 24),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallerScreen(
                              image: widget.image,
                              name: widget.name,
                              status: widget.chat.isActive == true
                                  ? "Available"
                                  : "Unavailable",
                            )));
              },
              icon: const Icon(Icons.call_rounded, size: 24),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // TO-DO
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  const PopupMenuItem(
                    value: "View contact",
                    child: Text("View contact"),
                  ),
                  const PopupMenuItem(
                    value: "Media, links, and docs",
                    child: Text("Media, links, and docs"),
                  ),
                  const PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  const PopupMenuItem(
                    value: "Mute notifications",
                    child: Text("Mute notifications"),
                  ),
                  const PopupMenuItem(
                    value: "Disappearing messages",
                    child: Text("Disappearing messages"),
                  ),
                  const PopupMenuItem(
                    value: "Wallpaper",
                    child: Text("Wallpaper"),
                  ),
                  PopupMenuItem(
                    value: "More",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("More"),
                        Icon(
                          Icons.arrow_right,
                          color: kTextColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: ChatBody(
          image: widget.image,
          name: widget.name,
        ),
      ),
    );
  }
}
