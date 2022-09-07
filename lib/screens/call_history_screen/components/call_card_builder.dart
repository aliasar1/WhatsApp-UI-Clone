import 'package:flutter/material.dart';

import '../../../models/chat.dart';
import '../../caller_screen/caller_screen.dart';

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
          children: [
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
              child: Icon(
                Icons.call,
                color: Theme.of(context).primaryColorLight,
                size: 24,
              ),
            ),
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
              child: Icon(
                Icons.videocam_rounded,
                color: Theme.of(context).primaryColorLight,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
