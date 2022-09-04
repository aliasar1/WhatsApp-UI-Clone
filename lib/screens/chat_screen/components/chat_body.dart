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
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.795,
              child: ListView.builder(
                reverse: true,
                itemCount: chatMessagesData.length,
                itemBuilder: ((context, index) => (index ==
                        chatMessagesData.length - 1)
                    ? Padding(
                        padding: const EdgeInsets.only(top: kLargePadding),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).disabledColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.lock,
                                          color: Theme.of(context)
                                              // ignore: deprecated_member_use
                                              .textSelectionColor,
                                          size: 14,
                                        )),
                                        TextSpan(
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  // ignore: deprecated_member_use
                                                  .textSelectionColor,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: kSmallPadding / 1.3),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.072,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            controller: _controller,
                            focusNode: focusNode,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  sendButton = true;
                                });
                              } else {
                                setState(() {
                                  sendButton = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  show
                                      ? Icons.keyboard
                                      : Icons.emoji_emotions_outlined,
                                  color: kDarkGreyColor,
                                ),
                                onPressed: () {
                                  if (!show) {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                  }
                                  setState(() {
                                    show = !show;
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.rotate(
                                    angle: -2.3,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.attachment,
                                        size: 26,
                                        color: kDarkGreyColor,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: kDarkGreyColor,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CameraScreen(
                                                    isCamTab: false,
                                                  )));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          right: 2,
                          left: 2,
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              isDarkMode ? kFreshPrimaryColor : kPrimaryColor,
                          child: IconButton(
                            icon: Icon(
                              sendButton ? Icons.send : Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (sendButton) {
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                                setState(() {
                                  sendButton = false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
