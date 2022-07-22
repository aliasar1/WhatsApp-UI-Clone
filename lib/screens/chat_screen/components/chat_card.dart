import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import 'audio_message.dart';
import 'image_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageType(ChatMessage message) {
      if (message.messageType == ChatMessageType.text) {
        return TextMessage(message: message);
      } else if (message.messageType == ChatMessageType.audio) {
        return AudioMessage(message: message);
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
          child: messageType(message),
        ),
      ],
    );
  }
}
