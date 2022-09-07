import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'components/contact_body.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        leadingWidth: 55,
        titleSpacing: 5,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Padding(
          padding: EdgeInsets.only(left: kMedPadding),
          child: Text("Select contact"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // TO-DO
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            },
          ),
        ],
      ),
      body: const ContactBody(),
    );
  }
}
