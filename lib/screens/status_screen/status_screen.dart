import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/screens/camera_screen/camera_screen.dart';

import '../../models/status.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          const ProfileCard(),
          const StatusBuilder(
            text: 'Recent updates',
          ),
          SizedBox(
            height: 125,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: kSmallPadding / 3),
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
              padding: const EdgeInsets.only(top: kSmallPadding / 3),
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
            heroTag: 'Edit',
            onPressed: () {},
            mini: true,
            backgroundColor: isDarkMode ? kDarkGreyColor : kShadeColor,
            child: const Icon(
              Icons.edit,
              color: kIconColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'Camera',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraScreen(
                            isCamTab: false,
                          )));
            },
            backgroundColor: Theme.of(context).primaryColorLight,
            child: const Icon(
              Icons.camera_alt,
              color: kBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
