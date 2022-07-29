import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../models/Chat.dart';
import 'components/transition_bar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key, required this.chat}) : super(key: key);
  final Chat chat;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: kShadeColor,
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: <Widget>[
            TransitionAppBar(
              extent: MediaQuery.of(context).size.height * 0.4,
              avatar: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(widget.chat.image),
              ),
              chat: widget.chat,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: kMedPadding),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: kMedPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.chat.status,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.chat.joinDate,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kMedPadding),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.21,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(kLargePadding),
                                child: Text(
                                  'Media, links, and docs',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: kDarkGreyColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(kLargePadding),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 16,
                                      child: Text(
                                        '81',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: kDarkGreyColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: kDarkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: kMedPadding),
                            child: SizedBox(
                              width: double.infinity,
                              height: 90,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: widget.chat.images.length + 1,
                                itemBuilder: (BuildContext context, int i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: kSmallPadding / 1.5),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: (i != widget.chat.images.length)
                                          ? Image.asset(
                                              widget.chat.images[i],
                                              fit: BoxFit.fitWidth,
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.only(
                                                  top: kLargePadding,
                                                  right: kLargePadding * 2.5,
                                                  left: kLargePadding * 2.5,
                                                  bottom: kLargePadding),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 22,
                                              ),
                                            ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kMedPadding),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
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
                                    activeTrackColor:
                                        kPrimaryColor.withOpacity(0.5),
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kMedPadding),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: kLargePadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  height: 50,
                                  child: const Icon(
                                    Icons.lock,
                                    size: 26,
                                    color: kDarkGreyColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Encrytion',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Messages and calls are end-to-end encrypted.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: kDarkGreyColor),
                                    ),
                                    Text(
                                      "Tap to verify.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: kDarkGreyColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  height: 35,
                                  child: const Icon(
                                    Icons.schedule,
                                    size: 26,
                                    color: kDarkGreyColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Disappearing messages',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Off",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: kDarkGreyColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kMedPadding),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: kLargePadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Other phones",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kDarkGreyColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: kMedPadding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.chat.number,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: kDarkGreyColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  const Icon(
                                    Icons.chat,
                                    size: 23,
                                    color: kPrimaryColor,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Icon(
                                    Icons.call,
                                    size: 23,
                                    color: kPrimaryColor,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Icon(
                                    Icons.videocam_rounded,
                                    size: 26,
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kMedPadding),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: kLargePadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.block,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Block ${widget.chat.name}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.thumb_down,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Report ${widget.chat.name}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
