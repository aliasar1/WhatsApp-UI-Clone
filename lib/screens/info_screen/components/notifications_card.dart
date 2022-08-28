import 'package:flutter/material.dart';

import '../../../constants.dart';

class NotificationsCard extends StatefulWidget {
  const NotificationsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kMedPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Padding(
          padding: const EdgeInsets.only(left: kLargePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: kDarkGreyColor,
                    size: 26,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Mute notifications",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Transform.scale(
                    scale: 1,
                    child: Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: kPrimaryColor,
                      activeTrackColor: kPrimaryColor.withOpacity(0.5),
                      inactiveThumbColor: kDarkGreyColor,
                      inactiveTrackColor: kIconColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.music_note,
                    color: kDarkGreyColor,
                    size: 26,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Custom notifications",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.photo,
                    color: kDarkGreyColor,
                    size: 26,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Media visibility",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
