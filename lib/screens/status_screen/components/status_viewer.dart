import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Status.dart';

class StatusViewer extends StatefulWidget {
  const StatusViewer({Key? key, required this.status}) : super(key: key);
  final Status status;

  @override
  State<StatusViewer> createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer> {

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: kLargePadding),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.status.image), fit: BoxFit.cover),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 23,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              toolbarHeight: 60,
              leadingWidth: 40,
              titleSpacing: 5,
              backgroundColor: Colors.transparent,
              title: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(widget.status.profile),
                ),
                title: Text(
                  widget.status.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: kBackgroundColor),
                ),
                subtitle: Text(
                  widget.status.time,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: kBackgroundColor),
                ),
              ),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // TO-DO
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      const PopupMenuItem(
                        value: "Mute",
                        child: Text("Mute"),
                      ),
                      const PopupMenuItem(
                        value: "Message",
                        child: Text("Message"),
                      ),
                      const PopupMenuItem(
                        value: "Voice call",
                        child: Text("Voice call"),
                      ),
                      const PopupMenuItem(
                        value: "Video call",
                        child: Text("Video call"),
                      ),
                      const PopupMenuItem(
                        value: "View contact",
                        child: Text("View contact"),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
