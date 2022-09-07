import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/screens/inbox_screen/components/group_members_avatar.dart';

import '../../../models/chat.dart';
import '../../contact_screen/components/contact_builder.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
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
          children: const [
            Text('New group'),
            SizedBox(
              height: 2,
            ),
            Opacity(
              opacity: 0.6,
              child: Text('Add participants',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
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
          Padding(
            padding: const EdgeInsets.only(
                right: kMedPadding, left: kMedPadding, bottom: kMedPadding),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chatsData.length + 1,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return Container(
                    height: groupMembers.isNotEmpty ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (chatsData[index - 1].isSelect == false) {
                      setState(() {
                        chatsData[index - 1].isSelect = true;
                        groupMembers.add(chatsData[index - 1]);
                      });
                    } else {
                      setState(() {
                        chatsData[index - 1].isSelect = false;
                        groupMembers.remove(chatsData[index - 1]);
                      });
                    }
                  },
                  child: ContactBuilder(
                    chat: chatsData[index - 1],
                  ),
                );
              }),
            ),
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
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
