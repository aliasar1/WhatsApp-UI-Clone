import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/chat_message.dart';
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
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).viewInsets.bottom) *
                  0.795,
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
                                              .primaryColorDark,
                                          size: 14,
                                        )),
                                        TextSpan(
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
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
              child: Container(
                margin: const EdgeInsets.only(top: kSmallPadding),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.bottom -
                        MediaQuery.of(context).viewInsets.bottom) *
                    0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        margin:
                            const EdgeInsets.only(left: 2, right: 2, bottom: 8),
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
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheet());
                                    },
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
                              _controller.clear();
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
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      margin: const EdgeInsets.only(
          left: kSmallPadding,
          right: kSmallPadding,
          bottom: kLargePadding * 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).backgroundColor,
      ),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kLargePadding * 4.5, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AttachmentToolCard(
                  name: 'Document',
                  icon: Icons.description,
                  colors: [
                    Color.fromARGB(255, 72, 16, 105),
                    Color.fromARGB(255, 140, 23, 207)
                  ],
                ),
                AttachmentToolCard(
                  name: 'Camera',
                  icon: Icons.photo_camera,
                  colors: [
                    Color.fromARGB(255, 122, 47, 54),
                    Color.fromARGB(255, 182, 83, 93),
                  ],
                ),
                AttachmentToolCard(
                  name: 'Gallery',
                  icon: Icons.photo,
                  colors: [
                    Color.fromARGB(255, 144, 48, 161),
                    Color.fromARGB(255, 218, 115, 236),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AttachmentToolCard(
                  name: 'Audio',
                  icon: Icons.headphones,
                  colors: [
                    Color.fromARGB(255, 187, 89, 8),
                    Color.fromARGB(255, 212, 117, 39),
                  ],
                ),
                AttachmentToolCard(
                  name: 'Location',
                  icon: Icons.location_on,
                  colors: [
                    Color.fromARGB(255, 47, 102, 21),
                    Color.fromARGB(255, 82, 150, 50),
                  ],
                ),
                AttachmentToolCard(
                  name: 'Contact',
                  icon: Icons.person,
                  colors: [
                    Color.fromARGB(255, 19, 86, 141),
                    Color.fromARGB(255, 47, 127, 192),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AttachmentToolCard extends StatelessWidget {
  const AttachmentToolCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.colors,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: colors,
              stops: const [0.5, 1],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Icon(icon),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
