import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/call_screen/components/call_info.dart';
import 'package:whatsapp_clone/screens/inbox_screen/components/profile_view.dart';

import '../../../constants.dart';
import '../../../models/CallsLog.dart';
import '../../inbox_screen/components/hero_dialogue.dart';

class CallBuilder extends StatelessWidget {
  const CallBuilder({
    Key? key,
    required this.callLog,
  }) : super(key: key);

  final CallLog callLog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CallInfoScreen(
                      callLog: callLog,
                    )));
      },
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return ProfileView(chat: callLog.chat);
            }));
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(callLog.image),
          ),
        ),
        title: Text(
          callLog.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        subtitle: Row(
          children: [
            callLog.callStatus == 'Outgoing'
                ? const Icon(
                    Icons.north_east_outlined,
                    size: 16,
                    color: kGreenColor,
                  )
                : Icon(
                    Icons.call_received_outlined,
                    size: 16,
                    color: callLog.size == '' ? kRedColor : kGreenColor,
                  ),
            Opacity(
              opacity: 0.8,
              child: Text(
                ' ${callLog.date}',
                maxLines: 1,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        trailing: callLog.isVideoCall
            ? InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.videocam_rounded,
                  color: kPrimaryColor,
                ),
              )
            : InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.call_sharp,
                  color: kPrimaryColor,
                ),
              ),
      ),
    );
  }
}
