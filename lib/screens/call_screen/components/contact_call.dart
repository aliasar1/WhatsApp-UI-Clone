import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';

class ContactCallScreen extends StatefulWidget {
  const ContactCallScreen({Key? key}) : super(key: key);

  @override
  State<ContactCallScreen> createState() => _ContactCallScreenState();
}

class _ContactCallScreenState extends State<ContactCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        leadingWidth: 55,
        titleSpacing: 5,
        backgroundColor: kPrimaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: kMedPadding),
          child: Column(
            children: const [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Select contact")),
              Align(
                alignment: Alignment.centerLeft,
                child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      "8 contacts",
                      style: TextStyle(fontSize: 14),
                    )),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // TO-DO
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            },
          ),
        ],
      ),
      body: const ContactBody(),
    );
  }
}

class ContactBody extends StatelessWidget {
  const ContactBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kLargePadding),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: kPrimaryColor),
                  child: const Icon(
                    Icons.group,
                    size: 22,
                    color: kBackgroundColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kLargePadding),
                  child: Text(
                    "New group call",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: kLargePadding * 1.5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kPrimaryColor),
                    child: const Icon(
                      Icons.person_add,
                      size: 22,
                      color: kBackgroundColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kLargePadding),
                    child: Text(
                      "New contact",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 190,
                  ),
                  const Icon(
                    Icons.qr_code_2,
                    color: kIconColor,
                    size: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kMedPadding),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chatsData.length,
                itemBuilder: ((context, index) => ContactBuilder(
                      chat: chatsData[index],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kLargePadding * 1.5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kShadeColor,
                    ),
                    child: const Icon(
                      Icons.share,
                      size: 22,
                      color: kIconColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kLargePadding),
                    child: Text(
                      "Share invite link",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kLargePadding * 1.2),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kShadeColor,
                    ),
                    child: const Icon(
                      Icons.question_mark,
                      size: 22,
                      color: kIconColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kLargePadding),
                    child: Text(
                      "Contacts help",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactBuilder extends StatelessWidget {
  const ContactBuilder({
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

/*
Padding(
      padding: const EdgeInsets.only(top: kLargePadding),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(chat.image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kMedPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
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
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
 */