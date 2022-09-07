import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/chat_message.dart';
import 'audio_message.dart';
import 'image_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard(
      {Key? key,
      required this.message,
      required this.image,
      required this.name})
      : super(key: key);

  final ChatMessage message;
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        message.messageType == ChatMessageType.image ||
                message.messageType == ChatMessageType.video
            ? message.isSender
                ? Row(
                    children: [
                      const ForwardButtonBuilder(),
                      ChatBubbleBuilder(
                        message: message,
                        image: image,
                        name: name,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      ChatBubbleBuilder(
                        message: message,
                        image: image,
                        name: name,
                      ),
                      const ForwardButtonBuilder(),
                    ],
                  )
            : ChatBubbleBuilder(
                message: message,
                image: image,
                name: name,
              ),
      ],
    );
  }
}

class ChatBubbleBuilder extends StatelessWidget {
  const ChatBubbleBuilder({
    Key? key,
    required this.message,
    required this.image,
    required this.name,
  }) : super(key: key);

  final ChatMessage message;
  final String image, name;

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
        return ImageMessage(
          message: message,
          name: name,
        );
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
            color: message.isSender
                ? Theme.of(context).focusColor
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(kMedSize * 1.4),
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kTextColor.withOpacity(0.1),
          ),
        ),
        Container(
          height: 23.0,
          width: 23.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/arrow.png"),
              fit: BoxFit.scaleDown,
              invertColors: true,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
