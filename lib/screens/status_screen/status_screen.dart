import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../models/Status.dart';
import 'components/profile_card.dart';
import 'components/status_builder.dart';
import 'components/status_card.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileCard(),
          const StatusBuilder(
            text: 'Recent updates',
          ),
          SizedBox(
            height: 125,
            child: ListView.builder(
              itemCount: statusData.length,
              itemBuilder: ((context, index) => statusData[index].isSeen == true
                  ? PublicStatusCard(
                      status: statusData[index],
                    )
                  : Container()),
            ),
          ),
          const StatusBuilder(
            text: 'Viewed updates',
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: statusData.length,
              itemBuilder: ((context, index) =>
                  statusData[index].isSeen == false
                      ? PublicStatusCard(
                          status: statusData[index],
                        )
                      : Container()),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            mini: true,
            backgroundColor: kShadeColor,
            child: const Icon(
              Icons.edit,
              color: kIconColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
