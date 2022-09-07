import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/status_screen/components/status_viewer.dart';

import '../../../constants.dart';
import '../../../models/status.dart';

class PublicStatusCard extends StatelessWidget {
  const PublicStatusCard({
    Key? key,
    required this.status,
  }) : super(key: key);

  final Status status;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StatusViewer(status: status)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: status.isSeen == true
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            isDarkMode ? kFreshPrimaryColor : kSecondaryColor,
                        width: 2,
                      ))
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kSeenColor,
                        width: 2,
                      )),
              child: Container(
                padding: const EdgeInsets.all(1.5),
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(status.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      status.time,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
