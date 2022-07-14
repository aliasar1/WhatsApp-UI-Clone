import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/Chat.dart';

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
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
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
      body: ListView.builder(
        itemCount: chatsData.length,
        itemBuilder: ((context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              ),
            )),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kSmallPadding * 1.5, vertical: kMedPadding),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(chat.image),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      chat.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Opacity(
                opacity: 0.5,
                child: Text(
                  '${chat.time}\n',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: chat.msgTotal == 0 ? kTextColor : kSecondaryColor),
                ),
              ),
              if (chat.msgTotal != 0)
                SizedBox(
                  height: 20,
                  width: 29,
                  child: CircleAvatar(
                    backgroundColor: kSecondaryColor,
                    radius: 12,
                    child: Text(
                      chat.msgTotal.toString(),
                      style: const TextStyle(
                          color: kBackgroundColor, fontSize: 14),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
