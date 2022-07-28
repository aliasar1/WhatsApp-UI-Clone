import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import '../../models/Chat.dart';
import 'components/transition_bar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key, required this.chat}) : super(key: key);
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kShadeColor,
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: <Widget>[
            TransitionAppBar(
              extent: MediaQuery.of(context).size.height * 0.4,
              avatar: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(chat.image),
              ),
              chat: chat,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const Text("HAHAH"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*
Container(
                          color: kBackgroundColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: AssetImage(chat.image),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: kMedPadding, bottom: kSmallPadding),
                                child: Text(
                                  chat.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: kTextColor),
                                ),
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Text(
                                  chat.number,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: kTextColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: kLargePadding),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildButton(Icons.chat, 'Message'),
                                    buildButton(Icons.call, 'Audio'),
                                    buildButton(
                                        Icons.videocam_rounded, 'Video'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
 */

/*
Visibility(
                  visible: top < 57.0 ? true : false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1.5),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(chat.image),
                        ),
                      ),
                      Text(
                        chat.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kBackgroundColor),
                      ),
                    ],
                  ),
                ),
*/


/*
Column(
        //   children: [
        //     Container(
        //       color: kBackgroundColor,
        //       height: MediaQuery.of(context).size.height * 0.45,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Align(
        //             alignment: Alignment.topLeft,
        //             child: Padding(
        //               padding: const EdgeInsets.only(
        //                   left: kMedPadding, top: kMedPadding),
        //               child: InkWell(
        //                 onTap: () {
        //                   Navigator.pop(context);
        //                 },
        //                 child: const Icon(
        //                   Icons.arrow_back,
        //                   color: kTextColor,
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: CircleAvatar(
        //                   radius: 70,
        //                   backgroundImage: AssetImage(chat.image),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                     top: kMedPadding, bottom: kSmallPadding),
        //                 child: Text(
        //                   chat.name,
        //                   style: const TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 20,
        //                       color: kTextColor),
        //                 ),
        //               ),
        //               Opacity(
        //                 opacity: 0.7,
        //                 child: Text(
        //                   chat.number,
        //                   style: const TextStyle(
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 14,
        //                       color: kTextColor),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(kLargePadding),
        //                 child: Row(
        //                   children: [
        //                     buildButton(Icons.chat, 'Message'),
        //                     buildButton(Icons.call, 'Audio'),
        //                     buildButton(Icons.videocam_rounded, 'Video'),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(
        //                 right: kMedPadding, top: kSmallPadding / 2),
        //             child: Align(
        //               alignment: Alignment.topRight,
        //               child: PopupMenuButton<String>(
        //                 onSelected: (value) {
        //                   // TO-DO
        //                 },
        //                 icon: const Icon(
        //                   Icons.more_vert,
        //                   color: kTextColor,
        //                 ),
        //                 itemBuilder: (BuildContext contesxt) {
        //                   return [
        //                     const PopupMenuItem(
        //                       value: "Share",
        //                       child: Text("Share"),
        //                     ),
        //                     const PopupMenuItem(
        //                       value: "Edit",
        //                       child: Text("Edit"),
        //                     ),
        //                     const PopupMenuItem(
        //                       value: "View in address book",
        //                       child: Text("View in address book"),
        //                     ),
        //                     const PopupMenuItem(
        //                       value: "Verify security code",
        //                       child: Text("Verify security code"),
        //                     ),
        //                   ];
        //                 },
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
 */
