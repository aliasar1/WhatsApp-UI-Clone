import 'package:flutter/material.dart';

import '../../../models/ChatMessage.dart';

class VideoMessage extends StatefulWidget {
  const VideoMessage({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  State<VideoMessage> createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
