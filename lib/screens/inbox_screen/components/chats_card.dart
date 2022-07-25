import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';
import 'hero_dialogue.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kSmallPadding * 1.5, vertical: kMedPadding),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(HeroDialogRoute(builder: (context) {
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
                      color: chat.msgTotal == 0 ? kTextColor : kSecondaryColor),
                ),
              ),
              if (chat.msgTotal != 0)
                SizedBox(
                  height: 20,
                  width: 29,
                  child: CircleAvatar(
                    backgroundColor: kSecondaryColor,
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
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, required this.chat}) : super(key: key);
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'profile',
        child: Material(
          child: SizedBox(
            height: 320,
            width: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 320,
                      width: 260,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(chat.image),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 260,
                      color: kAppBarColor.withOpacity(0.2),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: kSmallPadding),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              chat.name,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 260,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: kBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.chat,
                              color: kPrimaryColor,
                            ),
                            Icon(
                              Icons.call,
                              color: kPrimaryColor,
                            ),
                            Icon(
                              Icons.videocam_rounded,
                              color: kPrimaryColor,
                            ),
                            Icon(
                              Icons.info,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
