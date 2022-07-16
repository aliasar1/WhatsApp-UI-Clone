import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/CallsLog.dart';

class CallBuilder extends StatelessWidget {
  const CallBuilder({
    Key? key,
    required this.callLog,
  }) : super(key: key);

  final CallLog callLog;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(callLog.image),
      ),
      title: Text(
        callLog.name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Row(
        children: [
          callLog.callStatus == 'outgoing'
              ? const Icon(
                  Icons.north_east_outlined,
                  size: 16,
                  color: kGreenColor,
                )
              : const Icon(
                  Icons.call_received_outlined,
                  size: 16,
                  color: kRedColor,
                ),
          Opacity(
            opacity: 0.8,
            child: Text(
              ' ${callLog.date}',
              maxLines: 1,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
      trailing: callLog.isVideoCall
          ? const Icon(
              Icons.videocam_rounded,
              color: kPrimaryColor,
            )
          : const Icon(
              Icons.call_sharp,
              color: kPrimaryColor,
            ),
    );
  }
}
