import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/Chat.dart';
import 'package:whatsapp_clone/screens/status_screen/status_screen.dart';

import '../call_screen/call_screen.dart';
import 'components/chats_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
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
            style: TextStyle(
              fontSize: 20,
              color: kBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: kBackgroundColor),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: kBackgroundColor),
              onPressed: () {},
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
                          builder: (context) => const ChatScreen()),
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
            : Container());
  }
}
