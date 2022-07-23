import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../../models/ChatMessage.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSmallPadding),
      child: ImageBuilder(message: message),
    );
  }
}

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSmallSize),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: message.isSender
                  ? const AssetImage("assets/images/sea3.jpg")
                  : const AssetImage("assets/images/sea2.jpg"),
            ),
          ),
        ),
        !message.isSender
            ? Positioned(
                bottom: 3,
                right: -1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: kSmallPadding / 4, right: kSmallPadding / 2),
                  child: Text(
                    message.time,
                    style:
                        const TextStyle(fontSize: 12, color: kBackgroundColor),
                  ),
                ),
              )
            : Positioned(
                bottom: 3,
                right: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: kSmallPadding / 4, right: kSmallPadding / 2),
                  child: SizedBox(
                    height: 14,
                    width: 70,
                    child: Row(
                      children: [
                        Text(
                          message.time,
                          style: const TextStyle(
                              fontSize: 12, color: kBackgroundColor),
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
              ),
      ],
    );
  }
}
