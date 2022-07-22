import 'package:flutter/material.dart';

import '../../../models/ChatMessage.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
