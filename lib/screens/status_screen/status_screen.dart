import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/models/Chat.dart';
import 'package:whatsapp_clone/models/Profile.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profileData.length,
      itemBuilder: ((context, index) => StatusBuilder(
            profile: profileData[index],
          )),
    );
  }
}

class StatusBuilder extends StatelessWidget {
  const StatusBuilder({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kSmallPadding * 2, vertical: kMedPadding * 1.5),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(profile.image),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
