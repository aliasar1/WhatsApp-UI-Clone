import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/chat_message.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 80, top: 5, bottom: 20),
          child: Text(
            message.text,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: Row(
            children: [
              Text(
                message.time,
                style: const TextStyle(fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: message.isSender
                    ? const Icon(
                        Icons.done_all,
                        size: 18,
                        color: kReceivedColor,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
