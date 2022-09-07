import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/chat_message.dart';

class VideoMessage extends StatefulWidget {
  const VideoMessage({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  State<VideoMessage> createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        VideoTemplate(message: widget.message),
        Positioned(
          top: 56,
          left: 80,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDarkMode ? kDarkGreyColor : kIconColor.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              icon: isPlaying
                  ? Icon(
                      Icons.pause,
                      size: 35,
                      // ignore: deprecated_member_use
                      color: Theme.of(context).buttonColor,
                    )
                  : Icon(
                      Icons.play_arrow,
                      size: 35,
                      // ignore: deprecated_member_use
                      color: Theme.of(context).buttonColor,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoTemplate extends StatelessWidget {
  const VideoTemplate({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSmallPadding * 0.6),
      child: VideoBuilder(message: message),
    );
  }
}

class VideoBuilder extends StatelessWidget {
  const VideoBuilder({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMedSize),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: message.isSender
                  ? const AssetImage("assets/images/mount1.jpg")
                  : const AssetImage("assets/images/mount2.jpg"),
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
