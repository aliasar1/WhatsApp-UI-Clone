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
    return Padding(
      padding: const EdgeInsets.only(top: kLargePadding),
      child: InkWell(
        onTap: () {
          if (widget.chat.isSelect == false) {
            setState(() {
              widget.chat.isSelect = true;
            });
          } else {
            setState(() {
              widget.chat.isSelect = false;
            });
          }
        },
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
                      ? const Positioned(
                          bottom: 4,
                          right: 5,
                          child: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            radius: 8,
                            child: Icon(
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
