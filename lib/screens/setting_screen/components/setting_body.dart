import 'package:flutter/material.dart';

import '../../../constants.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage("assets/images/bill.jpg"),
          ),
          title: Text(
            "Ali Asar",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          subtitle: Text(
            "Hey there! I am using WhatsApp.",
            style: TextStyle(fontSize: 13),
          ),
          trailing: Icon(
            Icons.qr_code,
            color: kPrimaryColor,
          ),
        ),
        const Divider(height: 3),
        ListTile(
          minLeadingWidth: kMedSize,
          leading: Transform.rotate(
            angle: -4.75,
            child: const Padding(
              padding:
                  EdgeInsets.only(top: kMedPadding, left: kMedPadding / 1.5),
              child: Icon(
                Icons.key,
                color: kDarkGreyColor,
                size: 22,
              ),
            ),
          ),
          title: const Text('Account'),
          subtitle: const Text('Privacy, security, change number'),
        ),
        tileBuilder(Icons.chat, 'Chats', 'Theme, wallpapers, chat history'),
        tileBuilder(Icons.notifications, 'Notifications',
            'Message, group & call tones'),
        tileBuilder(Icons.circle_outlined, 'Storage and daata',
            'Network usage, auto-download'),
        tileBuilder(
            Icons.help, 'Help', 'Help centre, contact us, privacy policy'),
        tileBuilder(Icons.group, 'Invite a friend', null),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Opacity(
                opacity: 0.7,
                child: Text(
                  "from",
                  style: TextStyle(color: kTextColor, fontSize: 14),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/meta.png',
                    color: kTextColor,
                    height: 14,
                    width: 14,
                  ),
                  const Text(
                    " Meta",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PT Sans'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListTile tileBuilder(IconData icon, String title, String? subtitle) {
    return ListTile(
      minLeadingWidth: kMedSize,
      leading: Padding(
        padding: subtitle == null
            ? const EdgeInsets.only(top: 1)
            : const EdgeInsets.only(top: kSmallPadding),
        child: Icon(
          icon,
          color: kDarkGreyColor,
          size: 22,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: kSmallPadding),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: kSmallPadding),
        child: Text(
          subtitle ?? "",
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
