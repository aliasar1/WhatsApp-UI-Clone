import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

import 'components/draggable_sheet.dart';

class CallerScreen extends StatefulWidget {
  const CallerScreen(
      {Key? key, required this.name, required this.image, required this.status})
      : super(key: key);

  final String name;
  final String image;
  final String status;

  @override
  State<CallerScreen> createState() => _CallerScreenState();
}

class _CallerScreenState extends State<CallerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.35,
              image: AssetImage('assets/images/dark background.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kLargePadding * 4,
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(widget.image),
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: kBackgroundColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          widget.status == "Unavailable"
                              ? "Calling"
                              : "Ringing",
                          style: const TextStyle(
                            color: kBackgroundColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DraggableSheet(widget: widget),
            ],
          ),
        ),
      ),
    );
  }
}
