import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage("assets/images/bill.jpg"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kBackgroundColor,
                    width: 2,
                  )),
              child: const Center(
                child: Icon(Icons.add, color: kBackgroundColor, size: 16),
              ),
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'My Status',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
      subtitle: const Opacity(
        opacity: 0.8,
        child: Text(
          'Tap to add status update',
          maxLines: 1,
        ),
      ),
    );
  }
}
