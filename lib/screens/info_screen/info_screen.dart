import 'package:flutter/material.dart';

import '../../models/chat.dart';
import 'components/block_report_card.dart';
import 'components/encryption_card.dart';
import 'components/media_card.dart';
import 'components/notifications_card.dart';
import 'components/phonenumber_card.dart';
import 'components/status_info_card.dart';
import 'components/transition_bar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key, required this.chat}) : super(key: key);
  final Chat chat;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: <Widget>[
            TransitionAppBar(
              extent: MediaQuery.of(context).size.height * 0.4,
              avatar: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(widget.chat.image),
              ),
              chat: widget.chat,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  StatusInfoCard(widget: widget),
                  MediaBuilderCard(widget: widget),
                  const NotificationsCard(),
                  const EncryptionCard(),
                  PhoneNumberCard(widget: widget),
                  BlockReportCard(widget: widget),
                  const SizedBox(
                    height: 40,
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
