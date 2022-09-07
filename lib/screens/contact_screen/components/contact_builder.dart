import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/chat.dart';

class ContactBuilder extends StatefulWidget {
  const ContactBuilder({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final Chat chat;

  @override
  State<ContactBuilder> createState() => _ContactBuilderState();
}

class _ContactBuilderState extends State<ContactBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kMedPadding / 1.8),
        child: Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.chat.image),
                  ),
                  widget.chat.isSelect
                      ? Positioned(
                          bottom: 4,
                          right: 5,
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                            radius: 8,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kMedPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      widget.chat.status,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
