import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class CallContactBuilder extends StatelessWidget {
  const CallContactBuilder({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(chat.image),
      ),
      title: Text(
        chat.name,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        chat.status,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SizedBox(
        height: 40,
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.call,
              color: kPrimaryColor,
              size: 24,
            ),
            Icon(
              Icons.videocam_rounded,
              color: kPrimaryColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
