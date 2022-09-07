import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/chat.dart';
import 'package:whatsapp_clone/screens/camera_screen/camera_screen.dart';
import 'package:whatsapp_clone/screens/inbox_screen/components/broadcast_screen.dart';
import 'package:whatsapp_clone/screens/inbox_screen/components/linkdevice_screen.dart';
import 'package:whatsapp_clone/screens/inbox_screen/components/starred_messages.dart';
import 'package:whatsapp_clone/screens/status_screen/status_screen.dart';

import '../call_history_screen/call_screen.dart';
import 'components/newgroup_screen.dart';
import '../contact_screen/contact_screen.dart';
import '../setting_screen/setting_screen.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColor,
                pinned: true,
                floating: true,
                title: const Text(
                  'WhatsApp',
                ),
                elevation: 0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search, color: kBackgroundColor),
                    onPressed: () {
                      showSearch(context: context, delegate: CustomSearch());
                    },
                  ),
                  if (_tabController.index == 1)
                    PopupMenuButton<String>(
                      color:
                          isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                      onSelected: (value) {
                        if (value == "Settings") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()),
                          );
                        } else if (value == "New group") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewGroupScreen()),
                          );
                        } else if (value == "New broadcast") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BroadcastScreen()),
                          );
                        } else if (value == "Linked Devices") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LinkDeviceScreen()),
                          );
                        } else if (value == "Starred messages") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const StarredMessagesScreen()),
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) {
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
                    )
                  else if (_tabController.index == 2)
                    PopupMenuButton<String>(
                      color:
                          isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                      onSelected: (value) {
                        if (value == "Settings") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()),
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(
                            value: "Status privacy",
                            child: Text("Status privacy"),
                          ),
                          const PopupMenuItem(
                            value: "Settings",
                            child: Text("Settings"),
                          ),
                        ];
                      },
                    )
                  else
                    PopupMenuButton<String>(
                      color:
                          isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                      onSelected: (value) {
                        if (value == "Settings") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()),
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(
                            value: "Clear call log",
                            child: Text("Clear call log"),
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
                  labelColor: Theme.of(context).indicatorColor,
                  unselectedLabelColor: kShadeColor.withOpacity(0.5),
                  indicatorColor: Theme.of(context).indicatorColor,
                  indicatorWeight: 4,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              const CameraScreen(
                isCamTab: true,
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: kMedPadding),
                itemCount: chatsData.length + 1,
                itemBuilder: ((context, index) => (index != chatsData.length)
                    ? ChatCard(
                        chat: chatsData[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InboxScreen()),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(
                            top: kMedPadding, bottom: kLargePadding * 5),
                        child: Text(
                          "Tap and hold on a chat for more options",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: kIconColor),
                        ),
                      )),
              ),
              const StatusScreen(),
              const CallScreen(),
            ],
          ),
        ),
        floatingActionButton: _tabController.index == 1
            ? FloatingActionButton(
                heroTag: 'Contact',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactScreen()),
                  );
                },
                backgroundColor: Theme.of(context).primaryColorLight,
                child: const Icon(
                  Icons.chat,
                  color: kBackgroundColor,
                ),
              )
            : null);
  }

  bool getIsTabCamera(TabController tabController) {
    return tabController.animation!.value < 0.7;
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
