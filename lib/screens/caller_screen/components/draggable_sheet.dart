import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../caller_screen.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CallerScreen widget;

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  bool micOff = true;
  bool volumeDown = false;
  bool videoOn = false;
  var dragController = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        controller: dragController,
        initialChildSize: 0.2,
        minChildSize: 0.2,
        maxChildSize: 0.6,
        builder: (BuildContext context, myscrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: kDraggableSheetColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            ),
            child: ListView.builder(
              controller: myscrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Icon(
                      dragController.size > 0.4
                          ? Icons.expand_more
                          : Icons.expand_less,
                      size: 36,
                      color: kBackgroundColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: kLargePadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                volumeDown = !volumeDown;
                              });
                            },
                            child: Icon(
                              volumeDown ? Icons.volume_off : Icons.volume_up,
                              size: 28,
                              color: kBackgroundColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                videoOn = !videoOn;
                              });
                            },
                            child: Icon(
                              videoOn
                                  ? Icons.videocam_rounded
                                  : Icons.videocam_off,
                              size: 28,
                              color: kIconColor,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  micOff = !micOff;
                                });
                              },
                              child: Icon(
                                micOff ? Icons.mic : Icons.mic_off,
                                size: 28,
                                color: kBackgroundColor,
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kRedColor.withOpacity(0.7),
                              ),
                              child: const Icon(
                                Icons.call_end_rounded,
                                size: 28,
                                color: kBackgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: kIconColor,
                      height: 1,
                    ),
                    ListTile(
                      leading: Container(
                        height: 38,
                        width: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
                        child: const Icon(
                          Icons.person_add,
                          size: 22,
                          color: kBackgroundColor,
                        ),
                      ),
                      title: const Text(
                        "Add participants",
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(widget.widget.image),
                      ),
                      title: Text(
                        widget.widget.name,
                        style: const TextStyle(color: kSeenColor, fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.more_horiz,
                        size: 26,
                        color: kSeenColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
