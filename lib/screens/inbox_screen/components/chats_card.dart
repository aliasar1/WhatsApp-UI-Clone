import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chat_screen/chat_screen.dart';

import '../../../constants.dart';
import '../../../models/chat.dart';
import 'hero_dialogue.dart';
import 'profile_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      image: chat.image,
                      name: chat.name,
                      status: chat.isActive,
                      chat: chat,
                    )),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: kSmallPadding * 1.5,
            right: kSmallPadding * 1.5,
            bottom: kLargePadding * 1.3,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(HeroDialogRoute(builder: (context) {
                    return ProfileView(chat: chat);
                  }));
                },
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(chat.image),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          if (chat.isSeen == true && chat.msgTotal == 0)
                            const Icon(
                              Icons.done_all_sharp,
                              color: kReceivedColor,
                              size: 18,
                            )
                          else if (chat.isSeen == false && chat.msgTotal > 0)
                            const Icon(
                              Icons.done_all_sharp,
                              color: kIconColor,
                              size: 18,
                            )
                          else if (chat.isSeen == false && chat.msgTotal == 0)
                            const Icon(
                              Icons.done_all_sharp,
                              color: kIconColor,
                              size: 18,
                            ),
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              ' ${chat.lastMessage}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      '${chat.time}\n',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: chat.msgTotal == 0
                            ? kTextColor
                            : isDarkMode
                                ? kFreshPrimaryColor
                                : kSecondaryColor,
                      ),
                    ),
                  ),
                  if (chat.msgTotal != 0)
                    SizedBox(
                      height: 20,
                      width: 29,
                      child: CircleAvatar(
                        backgroundColor:
                            isDarkMode ? kFreshPrimaryColor : kSecondaryColor,
                        radius: 12,
                        child: Text(
                          chat.msgTotal.toString(),
                          style: const TextStyle(
                              color: kBackgroundColor, fontSize: 14),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
