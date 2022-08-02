import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

class StarredMessagesScreen extends StatelessWidget {
  const StarredMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const Text('Starred messages'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: const [
              Icon(
                Icons.circle,
                color: kPrimaryColor,
                size: 200,
              ),
              Icon(
                Icons.star_rounded,
                color: kBackgroundColor,
                size: 90,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
                top: kLargePadding * 2,
                right: kLargePadding * 6,
                left: kLargePadding * 6),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Text(
                'Tap and hold on any message in any chat to star it, so you can easily find it later.',
                textAlign: TextAlign.center,
                style: TextStyle(letterSpacing: 0.5, color: kDarkGreyColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
