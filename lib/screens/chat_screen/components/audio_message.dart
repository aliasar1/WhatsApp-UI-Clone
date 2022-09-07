import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../../models/chat_message.dart';

enum AuidoStatus { play, pause }

class AudioMessage extends StatefulWidget {
  const AudioMessage({
    Key? key,
    required this.message,
    required this.image,
  }) : super(key: key);

  final ChatMessage message;
  final String image;

  @override
  State<AudioMessage> createState() => _AudioMessageState();
}

class _AudioMessageState extends State<AudioMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kLargeSize * 2,
      width: kAudioContainerWidth * 1.2,
      child: widget.message.isSender
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PersonAvatarCard(message: widget.message, image: widget.image),
                AudioCardBuilder(message: widget.message),
                const SizedBox(
                  width: 5,
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AudioCardBuilder(message: widget.message),
                PersonAvatarCard(message: widget.message, image: widget.image),
              ],
            ),
    );
  }
}

class AudioCardBuilder extends StatefulWidget {
  const AudioCardBuilder({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  State<AudioCardBuilder> createState() => _AudioCardBuilderState();
}

class _AudioCardBuilderState extends State<AudioCardBuilder> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.message.isSender
          ? const EdgeInsets.only(right: 6)
          : const EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: kSmallPadding,
            ),
            child: SizedBox(
              width: 1,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: kMedPadding * 2),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 150,
                          height: 3,
                          color: kIconColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kReceivedColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                left: 25,
                child: Text(
                  widget.message.duration,
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              !widget.message.isSender
                  ? Positioned(
                      bottom: 3,
                      right: -1,
                      child: Text(
                        widget.message.time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  : Positioned(
                      bottom: 3,
                      right: 4,
                      child: SizedBox(
                        height: 14,
                        width: 70,
                        child: Row(
                          children: [
                            Text(
                              widget.message.time,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.done_all,
                                size: 18,
                                color: kReceivedColor,
                              ),
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
                      color: kReceivedColor,
                      size: 17,
                    ),
                  )
                : const Positioned(
                    bottom: -2.3,
                    left: -3.7,
                    child: Icon(
                      Icons.mic,
                      color: kReceivedColor,
                      size: 17,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
