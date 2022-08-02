import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

class LinkDeviceScreen extends StatelessWidget {
  const LinkDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Linked devices'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(kLargePadding * 2),
              child: Container(
                width: 280,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/linkdevice.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            const Text(
              'Use WhatsApp on other devices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kLargePadding),
              child: Container(
                width: double.infinity,
                height: 34,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'LINK A DEVICE',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(kLargePadding),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                            style: TextStyle(
                              color: kDarkGreyColor,
                            ),
                            text:
                                "Use WhatsApp on web, desktop or other devices without keeping your phone online."),
                        TextSpan(
                          style: TextStyle(
                            color: kReceivedColor,
                          ),
                          text: " Learn more",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
