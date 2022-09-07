import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/screens/chat_screen/components/image_preview.dart';

import '../../../models/chat_message.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({Key? key, required this.message, required this.name})
      : super(key: key);
  final ChatMessage message;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSmallPadding * 0.6),
      child: ImageBuilder(
        message: message,
        name: name,
      ),
    );
  }
}

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    Key? key,
    required this.message,
    required this.name,
  }) : super(key: key);

  final ChatMessage message;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageViewer(
            image: message.isSender
                ? "assets/images/sea3.jpeg"
                : "assets/images/sea2.jpeg",
            isSender: message.isSender,
            name: name,
            time: message.time,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kMedSize),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: message.isSender
                    ? const AssetImage("assets/images/sea3.jpeg")
                    : const AssetImage("assets/images/sea2.jpeg"),
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
                      style: const TextStyle(
                          fontSize: 12, color: kBackgroundColor),
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
      ),
    );
  }
}
