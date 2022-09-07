import 'package:flutter/material.dart';

import 'components/setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Settings"),
        elevation: 0,
      ),
      body: const SettingScreenBody(),
    );
  }
}
