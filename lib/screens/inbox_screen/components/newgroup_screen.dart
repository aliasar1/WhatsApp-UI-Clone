import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../../models/chat.dart';
import '../../contact_screen/components/contact_builder.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.only(
            right: kMedPadding, left: kMedPadding, bottom: kMedPadding),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: chatsData.length,
          itemBuilder: ((context, index) => ContactBuilder(
                chat: chatsData[index],
              )),
        ),
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
