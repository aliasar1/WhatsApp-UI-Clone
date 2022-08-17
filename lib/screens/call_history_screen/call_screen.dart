import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/CallsLog.dart';

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
      body: ListView.builder(
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
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add_call),
      ),
    );
  }
}
