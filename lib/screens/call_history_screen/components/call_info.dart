import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/calls_log.dart';
import 'package:whatsapp_clone/screens/chat_screen/chat_screen.dart';

import '../../caller_screen/caller_screen.dart';
import '../../inbox_screen/components/hero_dialogue.dart';
import '../../inbox_screen/components/profile_view.dart';

class CallInfoScreen extends StatelessWidget {
  const CallInfoScreen({Key? key, required this.callLog}) : super(key: key);

  final CallLog callLog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Call info"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              image: callLog.chat.image,
                              name: callLog.chat.name,
                              status: callLog.chat.isActive,
                              chat: callLog.chat,
                            )));
              },
              child: const Icon(Icons.chat, color: kBackgroundColor)),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "Remove from call log",
                  child: Text("Remove"),
                ),
                const PopupMenuItem(
                  value: "Block",
                  child: Text("Block"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return ProfileView(chat: callLog.chat);
                }));
              },
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(callLog.chat.image),
              ),
            ),
            title: Text(
              callLog.chat.name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            subtitle: Text(
              callLog.chat.status,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            trailing: SizedBox(
              width: 80,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CallerScreen(
                                image: callLog.image,
                                name: callLog.name,
                                status: callLog.duration == "Unavailable"
                                    ? "Unavailable"
                                    : "Available",
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.call,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.videocam_rounded,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 5,
            indent: 85,
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kLargePadding * 5.2, top: kSmallPadding),
              child: Text(
                callLog.date.split(',').elementAt(0),
                textAlign: TextAlign.left,
                style: const TextStyle(color: kDarkGreyColor, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kLargePadding * 0.8),
            child: ListTile(
              leading: callLog.callStatus == 'Outgoing'
                  ? const Padding(
                      padding: EdgeInsets.only(top: kMedPadding),
                      child: Icon(
                        Icons.north_east_outlined,
                        size: 24,
                        color: kGreenColor,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: kMedPadding),
                      child: Icon(
                        Icons.call_received_outlined,
                        size: 24,
                        color: callLog.size == '' ? kRedColor : kGreenColor,
                      ),
                    ),
              title: Text(callLog.size == '' ? 'Missed' : callLog.callStatus),
              subtitle: Text(callLog.date.split(',').elementAt(1).trim()),
              trailing: callLog.size == ''
                  ? const Text(
                      'Unavailable\n',
                      style: TextStyle(color: kDarkGreyColor, fontSize: 15),
                    )
                  : SizedBox(
                      width: 50,
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            callLog.duration,
                            style: const TextStyle(color: kDarkGreyColor),
                          ),
                          Text(
                            callLog.size,
                            style: const TextStyle(color: kDarkGreyColor),
                          ),
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
