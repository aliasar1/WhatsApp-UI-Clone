import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import 'chat_card.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              reverse: true,
              itemCount: chatMessagesData.length,
              itemBuilder: ((context, index) => ChatMessageCard(
                    message: chatMessagesData[index],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.52,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSenderMessageColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: kSmallPadding, right: kSmallPadding),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mood,
                            color: kIconColor.withOpacity(0.7),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: kSmallPadding, right: kSmallPadding),
                              child: TextField(
                                cursorColor: kPrimaryColor,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: "Message",
                                  hintStyle: TextStyle(
                                      color: kIconColor.withOpacity(0.9)),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Transform.rotate(
                                angle: -2.3,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.attachment, size: 26),
                                  color: kIconColor.withOpacity(0.9),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt, size: 24),
                                color: kIconColor.withOpacity(0.9),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kSmallPadding * 0.3),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        size: 22,
                        color: kBackgroundColor,
                      ),
                      color: kIconColor.withOpacity(0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
