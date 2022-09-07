import 'package:flutter/material.dart';

import '../../../models/chat.dart';

class GroupMembersAvatar extends StatefulWidget {
  const GroupMembersAvatar({Key? key, required this.chat}) : super(key: key);
  final Chat chat;

  @override
  State<GroupMembersAvatar> createState() => _GroupMembersAvatarState();
}

class _GroupMembersAvatarState extends State<GroupMembersAvatar> {
  @override
  Widget build(BuildContext context) {
    return widget.chat.isSelect
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(widget.chat.image),
                      ),
                      const Positioned(
                        bottom: 4,
                        right: 5,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 8,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.chat.name.split(" ").first,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
