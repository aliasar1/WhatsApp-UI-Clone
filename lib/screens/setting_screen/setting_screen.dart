import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import 'components/setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Settings"),
        elevation: 0,
      ),
      body: const SettingScreenBody(),
    );
  }
}
