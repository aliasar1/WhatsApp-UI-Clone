import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../models/Status.dart';
import 'components/profile_card.dart';

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

class PublicStatusCard extends StatelessWidget {
  const PublicStatusCard({
    Key? key,
    required this.status,
  }) : super(key: key);

  final Status status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: status.isSeen == true
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kSecondaryColor,
                      width: 3,
                    ))
                : BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kSeenColor,
                      width: 3,
                    )),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(status.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    status.time,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusBuilder extends StatelessWidget {
  const StatusBuilder({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 35,
          color: kShadeColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSmallPadding * 1.5,
            ),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
