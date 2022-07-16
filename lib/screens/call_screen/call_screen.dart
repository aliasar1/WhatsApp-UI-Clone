import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/CallsLog.dart';

import 'components/call_card.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callsData.length,
      itemBuilder: ((context, index) => CallBuilder(
            callLog: callsData[index],
          )),
    );
  }
}
