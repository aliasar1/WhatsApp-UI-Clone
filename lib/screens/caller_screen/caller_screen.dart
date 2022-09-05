import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

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
    bool micOff = true;
    var dragController = DraggableScrollableController();

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
              Expanded(
                child: DraggableScrollableSheet(
                  controller: dragController,
                  initialChildSize: 0.2,
                  minChildSize: 0.2,
                  maxChildSize: 0.6,
                  builder: (BuildContext context, myscrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: kDraggableSheetColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: ListView.builder(
                        controller: myscrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Icon(
                                dragController.size > 0.4
                                    ? Icons.expand_more
                                    : Icons.expand_less,
                                size: 36,
                                color: kBackgroundColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kLargePadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.volume_up,
                                      size: 28,
                                      color: kBackgroundColor,
                                    ),
                                    const Icon(
                                      Icons.videocam_rounded,
                                      size: 28,
                                      color: kIconColor,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          micOff = !micOff;
                                        });
                                      },
                                      child: micOff
                                          ? const Icon(
                                              Icons.mic_off,
                                              size: 28,
                                              color: kBackgroundColor,
                                            )
                                          : const Icon(
                                              Icons.mic,
                                              size: 28,
                                              color: kBackgroundColor,
                                            ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kRedColor.withOpacity(0.7),
                                        ),
                                        child: const Icon(
                                          Icons.call_end_rounded,
                                          size: 28,
                                          color: kBackgroundColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: kIconColor,
                                height: 1,
                              ),
                              ListTile(
                                leading: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.person_add,
                                    size: 22,
                                    color: kBackgroundColor,
                                  ),
                                ),
                                title: const Text(
                                  "Add participants",
                                  style: TextStyle(
                                      color: kBackgroundColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 18,
                                  backgroundImage: AssetImage(widget.image),
                                ),
                                title: Text(
                                  widget.name,
                                  style: const TextStyle(
                                      color: kSeenColor, fontSize: 16),
                                ),
                                trailing: const Icon(
                                  Icons.more_horiz,
                                  size: 26,
                                  color: kSeenColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
