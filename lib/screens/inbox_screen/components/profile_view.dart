import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chat_screen/chat_screen.dart';
import 'package:whatsapp_clone/screens/info_screen/info_screen.dart';

import '../../../constants.dart';
import '../../../models/chat.dart';
import '../../caller_screen/caller_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, required this.chat}) : super(key: key);
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Hero(
        tag: 'profile',
        child: Material(
          child: SizedBox(
            height: 320,
            width: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      color:
                          isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                      height: 320,
                      width: 260,
                      child: FittedBox(
                        clipBehavior: Clip.hardEdge,
                        fit: BoxFit.fitHeight,
                        child: Image.asset(chat.image),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 260,
                      color: kAppBarColor.withOpacity(0.2),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: kSmallPadding),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              chat.name,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 260,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? kBlackShadowBgColor
                              : kBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                            image: chat.image,
                                            name: chat.name,
                                            status: chat.isActive,
                                            chat: chat,
                                          )),
                                );
                              },
                              child: Icon(
                                Icons.chat,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CallerScreen(
                                              image: chat.image,
                                              name: chat.name,
                                              status: chat.isActive == true
                                                  ? "Available"
                                                  : "Unavailable",
                                            )));
                              },
                              child: Icon(
                                Icons.call,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CallerScreen(
                                              image: chat.image,
                                              name: chat.name,
                                              status: chat.isActive == true
                                                  ? "Available"
                                                  : "Unavailable",
                                            )));
                              },
                              child: Icon(
                                Icons.videocam_rounded,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InfoScreen(
                                            chat: chat,
                                          )),
                                );
                              },
                              child: Icon(
                                Icons.info,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
