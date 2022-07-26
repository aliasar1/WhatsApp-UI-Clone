import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class ContactBuilder extends StatelessWidget {
  const ContactBuilder({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kLargePadding),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(chat.image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kMedPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    chat.status,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
