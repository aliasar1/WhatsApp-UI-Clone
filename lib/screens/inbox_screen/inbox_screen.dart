import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/Chat.dart';
import 'package:whatsapp_clone/screens/contact_screen/components/contact_screen.dart';
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
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactScreen()),
                  );
                },
                backgroundColor: kPrimaryColor,
                child: const Icon(Icons.chat),
              )
            : null);
  }
}

class CustomSearch extends SearchDelegate {
  List<String> data = [
    'Jenny Wilson',
    'Esther Howard',
    'Ralph Edwards',
    'Jacob Jones',
    'Albert Flores'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        results.add(item);
      }
    }
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          var show = results[index];
          return ListTile(
            title: Text(show),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> results = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        results.add(item);
      }
    }
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          var show = results[index];
          return ListTile(
            title: Text(show),
          );
        });
  }
}
