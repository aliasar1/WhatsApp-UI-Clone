import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/Chat.dart';
import 'package:whatsapp_clone/screens/status_screen/status_screen.dart';

import '../call_screen/call_screen.dart';
import 'components/chats_card.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: const Text(
            'WhatsApp',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: kBackgroundColor),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // TO-DO
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  const PopupMenuItem(
                    value: "New group",
                    child: Text("New group"),
                  ),
                  const PopupMenuItem(
                    value: "New broadcast",
                    child: Text("New broadcast"),
                  ),
                  const PopupMenuItem(
                    value: "Linked Devices",
                    child: Text("Linked devices"),
                  ),
                  const PopupMenuItem(
                    value: "Starred messages",
                    child: Text("Starred messages"),
                  ),
                  const PopupMenuItem(
                    value: "Settings",
                    child: Text("Settings"),
                  ),
                ];
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt,
                    color: kBackgroundColor.withOpacity(0.7)),
              ),
              const SizedBox(
                width: 86,
                child: Tab(
                  text: 'CHATS',
                ),
              ),
              const SizedBox(
                width: 86,
                child: Tab(
                  text: 'STATUS',
                ),
              ),
              const SizedBox(
                width: 86,
                child: Tab(
                  text: 'CALLS',
                ),
              ),
            ],
            labelColor: kBackgroundColor,
            indicatorColor: kBackgroundColor,
            indicatorWeight: 4,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const Text(""),
            ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: ((context, index) => ChatCard(
                    chat: chatsData[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InboxScreen()),
                    ),
                  )),
            ),
            const StatusScreen(),
            const CallScreen(),
          ],
        ),
        floatingActionButton: _tabController.index == 1
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: kPrimaryColor,
                child: const Icon(Icons.chat),
              )
            : null);
  }
}
