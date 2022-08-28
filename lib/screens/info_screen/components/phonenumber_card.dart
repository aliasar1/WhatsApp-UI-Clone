import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../caller_screen/caller_screen.dart';
import '../../chat_screen/chat_screen.dart';
import '../info_screen.dart';

class PhoneNumberCard extends StatelessWidget {
  const PhoneNumberCard({Key? key, required this.widget}) : super(key: key);

  final InfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kMedPadding),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: double.infinity,
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
                padding: const EdgeInsets.only(bottom: kMedPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chat.number,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                      image: widget.chat.image,
                                      name: widget.chat.name,
                                      status: widget.chat.isActive,
                                      chat: widget.chat,
                                    )));
                      },
                      child: Icon(
                        Icons.chat,
                        size: 23,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CallerScreen(
                                      image: widget.chat.image,
                                      name: widget.chat.name,
                                      status: widget.chat.isActive == true
                                          ? "Available"
                                          : "Unavailable",
                                    )));
                      },
                      child: Icon(
                        Icons.call,
                        size: 23,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CallerScreen(
                                      image: widget.chat.image,
                                      name: widget.chat.name,
                                      status: widget.chat.isActive == true
                                          ? "Available"
                                          : "Unavailable",
                                    )));
                      },
                      child: Icon(
                        Icons.videocam_rounded,
                        size: 26,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
