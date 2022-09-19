import 'package:flutter/material.dart';

import '/models/calls_log.dart';
import '../../constants.dart';
import 'components/call_card.dart';
import 'components/contact_call.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        padding: const EdgeInsets.only(top: kSmallPadding / 2),
        itemCount: callsData.length,
        itemBuilder: ((context, index) =>
            CallBuilder(callLog: callsData[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ContactCallScreen()));
        },
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Icon(
          Icons.add_call,
          color: kBackgroundColor,
        ),
      ),
    );
  }
}
