import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../../models/ChatMessage.dart';

enum AuidoStatus { play, pause }

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.message,
    required this.image,
  }) : super(key: key);

  final ChatMessage message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kLargeSize * 2,
      width: kAudioContainerWidth * 1.2,
      child: message.isSender
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PersonAvatarCard(message: message, image: image),
                AudioCardBuilder(message: message),
                SizedBox(
                  width: 5,
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AudioCardBuilder(message: message),
                PersonAvatarCard(message: message, image: image),
              ],
            ),
    );
  }
}

class AudioCardBuilder extends StatelessWidget {
  const AudioCardBuilder({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: message.isSender
          ? const EdgeInsets.only(right: 6)
          : const EdgeInsets.only(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: kSmallPadding,
            ),
            child: SizedBox(
              width: 1,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.play_arrow)),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: kMedPadding * 2),
                  child: Container(
                    width: 150,
                    height: 3,
                    color: kIconColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                left: 25,
                child: Text(
                  message.duration,
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              !message.isSender
                  ? Positioned(
                      bottom: 3,
                      right: -1,
                      child: Text(
                        message.time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  : Positioned(
                      bottom: 3,
                      right: 4,
                      child: SizedBox(
                        height: 14,
                        width: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              message.time,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Icon(
                              Icons.done_all,
                              size: 18,
                              color: kReceivedColor,
                            ),
                          ],
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

class PersonAvatarCard extends StatelessWidget {
  const PersonAvatarCard({
    Key? key,
    required this.message,
    required this.image,
  }) : super(key: key);

  final ChatMessage message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: message.isSender
          ? const EdgeInsets.only(left: kSmallPadding * 1.2)
          : const EdgeInsets.only(right: kSmallPadding * 1.2),
      child: Align(
        alignment:
            message.isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Stack(
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: CircleAvatar(
                radius: 14,
                backgroundImage: message.isSender
                    ? const AssetImage("assets/images/bill.jpg")
                    : AssetImage(image),
              ),
            ),
            message.isSender
                ? const Positioned(
                    bottom: -2.3,
                    right: -3.7,
                    child: Icon(
                      Icons.mic,
                      color: kHighlightColor,
                      size: 17,
                    ),
                  )
                : const Positioned(
                    bottom: -2.3,
                    left: -3.7,
                    child: Icon(
                      Icons.mic,
                      color: kHighlightColor,
                      size: 17,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
