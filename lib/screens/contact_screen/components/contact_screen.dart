import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/Chat.dart';

import '../../../constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        title: const Padding(
          padding: EdgeInsets.only(left: kMedPadding),
          child: Text("Select contact"),
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
      body: SingleChildScrollView(
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
                      "New group",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
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
                          fontWeight: FontWeight.w600,
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
              const Padding(
                padding: EdgeInsets.only(top: kLargePadding * 1.4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contacts on WhatsApp",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kIconColor),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chatsData.length,
                itemBuilder: ((context, index) => ContactBuilder(
                      chat: chatsData[index],
                    )),
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
                          fontWeight: FontWeight.w600,
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                    fontWeight: FontWeight.w600,
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
