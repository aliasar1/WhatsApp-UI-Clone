import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/status.dart';

class StatusViewer extends StatefulWidget {
  const StatusViewer({Key? key, required this.status}) : super(key: key);
  final Status status;

  @override
  State<StatusViewer> createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          if (controller.value.toStringAsFixed(2) == '0.99' ||
              controller.value.toStringAsFixed(2) == '0.98') {
            Navigator.of(context).maybePop();
          }
        });
      });
    controller.repeat(reverse: false);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTapDown: (_) {
          controller.stop();
        },
        onLongPressDown: (_) {
          controller.stop();
        },
        onLongPressUp: () {
          controller.repeat();
        },
        onTap: () {
          Navigator.of(context).maybePop();
        },
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            Navigator.pop(context);
          } else if (details.delta.dx < -sensitivity) {
            Navigator.pop(context);
          }
        },
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            Navigator.pop(context);
          } else if (details.delta.dy < -sensitivity) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: kLargePadding),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.status.image), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kSmallPadding),
                  child: LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                    minHeight: 4.0,
                    backgroundColor: kIconColor,
                    color: kBackgroundColor,
                  ),
                ),
                Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    toolbarHeight: 90,
                    leadingWidth: 35,
                    titleSpacing: 5,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      padding: const EdgeInsets.all(kSmallPadding / 4),
                      splashRadius: 25,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 23,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: ListTile(
                      contentPadding: const EdgeInsets.only(left: 1),
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kBackgroundColor,
                              width: 3,
                            )),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(widget.status.profile),
                        ),
                      ),
                      title: Text(
                        widget.status.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: kBackgroundColor),
                      ),
                      subtitle: Opacity(
                        opacity: 0.7,
                        child: Text(
                          widget.status.time,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: kBackgroundColor),
                        ),
                      ),
                    ),
                    actions: [
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          // TO-DO
                        },
                        itemBuilder: (BuildContext contesxt) {
                          return [
                            const PopupMenuItem(
                              value: "Mute",
                              child: Text("Mute"),
                            ),
                            const PopupMenuItem(
                              value: "Message",
                              child: Text("Message"),
                            ),
                            const PopupMenuItem(
                              value: "Voice call",
                              child: Text("Voice call"),
                            ),
                            const PopupMenuItem(
                              value: "Video call",
                              child: Text("Video call"),
                            ),
                            const PopupMenuItem(
                              value: "View contact",
                              child: Text("View contact"),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                  body: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: kMedPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.expand_less,
                            color: kBackgroundColor,
                            size: 24,
                          ),
                          Text(
                            "Reply",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kBackgroundColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
