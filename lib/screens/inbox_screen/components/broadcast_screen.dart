import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/chat.dart';
import '../../contact_screen/components/contact_builder.dart';
import 'group_members_avatar.dart';

class BroadcastScreen extends StatefulWidget {
  const BroadcastScreen({Key? key}) : super(key: key);

  @override
  State<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends State<BroadcastScreen> {
  var count = 0;
  List<Chat> groupMembers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('New broadcast'),
            const SizedBox(
              height: 2,
            ),
            Opacity(
              opacity: 0.6,
              child: Text('${'$count of ${chatsData.length}'} selected',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 26,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: kSmallPadding,
                    left: kSmallPadding,
                    bottom: kLargePadding * 1.6,
                    top: kLargePadding * 2),
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: const Text(
                      "Only contacts with +92 331 3211231 in their address book will receive your broadcast message.",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: kMedPadding, left: kMedPadding, bottom: kMedPadding),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatsData.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        if (chatsData[index].isSelect == false) {
                          setState(() {
                            chatsData[index].isSelect = true;
                            groupMembers.add(chatsData[index]);
                            count++;
                          });
                        } else {
                          setState(() {
                            chatsData[index].isSelect = false;
                            groupMembers.remove(chatsData[index]);
                            if (count != 0) count--;
                          });
                        }
                      },
                      child: ContactBuilder(
                        chat: chatsData[index],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          groupMembers.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      color: Theme.of(context).backgroundColor,
                      height: 75,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: chatsData.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  groupMembers.remove(chatsData[index]);
                                  chatsData[index].isSelect = false;
                                  count--;
                                });
                              },
                              child: GroupMembersAvatar(
                                chat: chatsData[index],
                              ),
                            );
                          })),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'New group',
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.done,
        ),
      ),
    );
  }
}
