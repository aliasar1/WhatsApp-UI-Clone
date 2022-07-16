import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/CallsLog.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callsData.length,
      itemBuilder: ((context, index) => Row(
            children: [],
          )),
    );
  }
}
