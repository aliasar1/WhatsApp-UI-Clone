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
      width: kAudioContainerWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 5,
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
                    width: 120,
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
              Positioned(
                bottom: 3,
                right: 2,
                child: Text(
                  message.time,
                  style: const TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: kSmallPadding),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
