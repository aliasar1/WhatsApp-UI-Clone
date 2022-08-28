import 'package:flutter/material.dart';

import '../../../constants.dart';

class EncryptionCard extends StatelessWidget {
  const EncryptionCard({
    Key? key,
  }) : super(key: key);

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
                            fontSize: 16, fontWeight: FontWeight.w400),
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
                            fontSize: 16, fontWeight: FontWeight.w400),
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
    );
  }
}
