import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import '../../camera_screen/camera_screen.dart';
import 'chat_card.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image, name;

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                reverse: true,
                itemCount: chatMessagesData.length,
                itemBuilder: ((context, index) => (index ==
                        chatMessagesData.length - 1)
                    ? Padding(
                        padding: const EdgeInsets.only(top: kLargePadding),
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: kYellowColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.lock,
                                          color: kDarkGreyColor,
                                          size: 14,
                                        )),
                                        TextSpan(
                                            style: TextStyle(
                                              color: kDarkGreyColor,
                                            ),
                                            text:
                                                " Messages and calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Tap to learn more."),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    : ChatMessageCard(
                        message: chatMessagesData[index],
                        image: widget.image,
                        name: widget.name,
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
                        color: Theme.of(context).highlightColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: kSmallPadding, right: kSmallPadding),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.mood,
                                color: kIconColor.withOpacity(0.7),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: kSmallPadding, right: kSmallPadding),
                                child: TextField(
                                  controller: _textController,
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
                                    icon:
                                        const Icon(Icons.attachment, size: 26),
                                    color: kIconColor.withOpacity(0.9),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CameraScreen(
                                                  isCamTab: false,
                                                )));
                                  },
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
                        icon: Icon(
                          _textController.text == "" ? Icons.mic : Icons.send,
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
      ),
    );
  }
}
