import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../../models/chat.dart';
import '../../caller_screen/caller_screen.dart';
import '../../chat_screen/chat_screen.dart';

class TransitionAppBar extends StatelessWidget {
  final Widget avatar;
  final Chat chat;
  final double extent;

  const TransitionAppBar({
    required this.avatar,
    this.extent = 250,
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
          chat: chat, avatar: avatar, extent: extent > 200 ? extent : 200),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(top: kLargePadding * 1.2),
    end: const EdgeInsets.only(
        left: kLargePadding * 2.5, top: kLargePadding * 0.5),
  );

  final _avatarAlignTween =
      AlignmentTween(begin: Alignment.topCenter, end: Alignment.topLeft);

  final Widget avatar;
  final double extent;
  final Chat chat;

  var top = 0.0;

  _TransitionAppBarDelegate(
      {required this.avatar, this.extent = 250, required this.chat})
      : assert(extent >= 200);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = 72 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    final avatarMargin = _avatarMarginTween.lerp(progress);

    final avatarAlign = _avatarAlignTween.lerp(progress);

    final avatarSize = (1 - progress / 1.2) * 80 + 32;

    return LayoutBuilder(
      builder: ((context, constraints) {
        top = constraints.biggest.height;

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: 60,
                constraints: BoxConstraints(maxHeight: minExtent),
                color: top <= 140
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kMedPadding * 0.8, top: kMedPadding * 1.6),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: top <= 140 ? kBackgroundColor : kIconColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: avatarMargin,
                child: Align(
                  alignment: avatarAlign,
                  child: SizedBox(
                    height: avatarSize,
                    width: avatarSize,
                    child: avatar,
                  ),
                ),
              ),
              top <= 88
                  ? Padding(
                      padding: const EdgeInsets.only(left: kLargePadding * 5.7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          chat.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                    )
                  : const Text(""),
              Visibility(
                visible: top <= 190 ? false : true,
                child: Positioned(
                  bottom: 110,
                  right: 145,
                  child: Opacity(
                    opacity: top <= 244 ? 0.2 : 1.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        chat.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: top <= 165 ? false : true,
                child: Positioned(
                  bottom: 90,
                  right: 150,
                  child: Opacity(
                    opacity: top <= 204 ? 0.2 : 0.7,
                    child: Text(
                      chat.number,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: top <= 90 ? false : true,
                child: Positioned(
                  bottom: 10,
                  right: 100,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          image: chat.image,
                                          name: chat.name,
                                          status: chat.isActive,
                                          chat: chat,
                                        )));
                          },
                          child: buildButton(Icons.chat, 'Message', context)),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CallerScreen(
                                          image: chat.image,
                                          name: chat.name,
                                          status: chat.isActive == true
                                              ? "Available"
                                              : "Unavailable",
                                        )));
                          },
                          child: buildButton(Icons.call, 'Audio', context)),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CallerScreen(
                                          image: chat.image,
                                          name: chat.name,
                                          status: chat.isActive == true
                                              ? "Available"
                                              : "Unavailable",
                                        )));
                          },
                          child: buildButton(
                              Icons.videocam_rounded, 'Video', context)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: kSmallPadding * 0.1, top: kSmallPadding),
                child: Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      // TO-DO
                    },
                    icon: Icon(
                      Icons.more_vert,
                      color: top <= 90 ? kBackgroundColor : kIconColor,
                    ),
                    itemBuilder: (BuildContext contesxt) {
                      return [
                        const PopupMenuItem(
                          value: "Share",
                          child: Text("Share"),
                        ),
                        const PopupMenuItem(
                          value: "Edit",
                          child: Text("Edit"),
                        ),
                        const PopupMenuItem(
                          value: "View in address book",
                          child: Text("View in address book"),
                        ),
                        const PopupMenuItem(
                          value: "Verify security code",
                          child: Text("Verify security code"),
                        ),
                      ];
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar;
  }

  Container buildButton(IconData icon, String text, BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      color: Colors.transparent,
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColorLight,
            size: 26,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
