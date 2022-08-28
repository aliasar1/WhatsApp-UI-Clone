import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../info_screen.dart';

class BlockReportCard extends StatelessWidget {
  const BlockReportCard({Key? key, required this.widget}) : super(key: key);

  final InfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kMedPadding),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.only(left: kLargePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.block,
                    color: Colors.red,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Block ${widget.chat.name}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Report ${widget.chat.name}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
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
