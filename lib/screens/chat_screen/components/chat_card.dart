import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import 'audio_message.dart';
import 'image_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard({Key? key, required this.message, required this.image})
      : super(key: key);

  final ChatMessage message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        message.messageType == ChatMessageType.image
            ? message.isSender
                ? Row(
                    children: [
                      const ForwardButtonBuilder(),
                      ChatBubbleBuilder(message: message, image: image),
                    ],
                  )
                : Row(
                    children: [
                      ChatBubbleBuilder(message: message, image: image),
                      const ForwardButtonBuilder(),
                    ],
                  )
            : ChatBubbleBuilder(message: message, image: image),
      ],
    );
  }
}

class ChatBubbleBuilder extends StatelessWidget {
  const ChatBubbleBuilder({
    Key? key,
    required this.message,
    required this.image,
  }) : super(key: key);

  final ChatMessage message;
  final String image;

  @override
  Widget build(BuildContext context) {
    Widget messageType(ChatMessage message, String image) {
      if (message.messageType == ChatMessageType.text) {
        return TextMessage(message: message);
      } else if (message.messageType == ChatMessageType.audio) {
        return AudioMessage(message: message, image: image);
      } else if (message.messageType == ChatMessageType.video) {
        return VideoMessage(message: message);
      } else if (message.messageType == ChatMessageType.image) {
        return ImageMessage(message: message);
      } else {
        return Container();
      }
    }

    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: kMedPadding,
            right: kMedPadding * 0.8,
            left: kMedPadding * 0.8,
          ),
          decoration: BoxDecoration(
            color:
                message.isSender ? kReceiverMessageColor : kSenderMessageColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: messageType(
            message,
            image,
          ),
        ),
      ],
    );
  }
}

class ForwardButtonBuilder extends StatelessWidget {
  const ForwardButtonBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.1),
        image: const DecorationImage(
          image: AssetImage("assets/images/arrow.png"),
          invertColors: true,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
