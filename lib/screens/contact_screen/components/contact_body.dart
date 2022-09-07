import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/chat.dart';
import 'contact_builder.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kLargePadding),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: const Icon(
                    Icons.group,
                    size: 22,
                    color: kBackgroundColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kLargePadding),
                  child: Text(
                    "New group",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: kLargePadding * 1.5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: const Icon(
                      Icons.person_add,
                      size: 22,
                      color: kBackgroundColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kLargePadding),
                    child: Text(
                      "New contact",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 190,
                  ),
                  const Icon(
                    Icons.qr_code_2,
                    color: kIconColor,
                    size: 25,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: kLargePadding * 1.4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contacts on WhatsApp",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: kIconColor),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatsData.length,
              itemBuilder: ((context, index) => ContactBuilder(
                    chat: chatsData[index],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kLargePadding * 1.5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kShadeColor,
                    ),
                    child: const Icon(
                      Icons.share,
                      size: 22,
                      color: kDarkGreyColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kLargePadding),
                    child: Text(
                      "Share invite link",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kLargePadding * 1.2),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kShadeColor,
                    ),
                    child: const Icon(
                      Icons.question_mark,
                      size: 22,
                      color: kDarkGreyColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kLargePadding),
                    child: Text(
                      "Contacts help",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
