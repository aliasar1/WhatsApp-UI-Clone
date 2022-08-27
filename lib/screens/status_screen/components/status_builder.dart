import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatusBuilder extends StatelessWidget {
  const StatusBuilder({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 35,
          color: Theme.of(context).shadowColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSmallPadding * 1.5,
            ),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
