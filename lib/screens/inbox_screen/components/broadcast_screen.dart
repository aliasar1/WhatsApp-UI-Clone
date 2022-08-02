import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Chat.dart';
import '../../contact_screen/components/contact_builder.dart';

class BroadcastScreen extends StatelessWidget {
  const BroadcastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('New broadcast'),
            SizedBox(
              height: 2,
            ),
            Opacity(
              opacity: 0.6,
              child: Text('0 of 8 selected',
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                right: kSmallPadding,
                left: kSmallPadding,
                bottom: kLargePadding,
                top: kLargePadding * 2),
            child: Opacity(
              opacity: 0.6,
              child: Text(
                "Only contacts with +92 331 3211231 in their address book will receive your broadcast message.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
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
