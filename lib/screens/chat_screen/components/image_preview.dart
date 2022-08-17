import 'package:flutter/material.dart';

import '../../../constants.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer(
      {Key? key,
      required this.image,
      required this.name,
      required this.isSender,
      required this.time})
      : super(key: key);
  final String image, time;
  final String name;
  final bool isSender;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    bool isStarred = false;
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dy > sensitivity) {
          Navigator.pop(context);
        } else if (details.delta.dy < -sensitivity) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.isSender
                  ? const Align(
                      alignment: Alignment.centerLeft, child: Text("You"))
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.name)),
              Align(
                alignment: Alignment.centerLeft,
                child: Opacity(
                    opacity: 0.6,
                    child: Text(
                      widget.time,
                      style: const TextStyle(fontSize: 14),
                    )),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isStarred = !isStarred;
                });
              },
              icon: isStarred == false
                  ? const Icon(Icons.grade_outlined, color: kBackgroundColor)
                  : const Icon(Icons.grade, color: kBackgroundColor),
            ),
            IconButton(
              icon: const Icon(Icons.forward, color: kBackgroundColor),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == "Set") {
                  PopupMenuButton<String>(
                    onSelected: (value) {},
                    itemBuilder: (BuildContext contesxt) {
                      return [
                        const PopupMenuItem(
                          value: "My profile photo",
                          child: Text("My profile photo"),
                        ),
                        const PopupMenuItem(
                          value: "Group icon",
                          child: Text("Group icon"),
                        ),
                        const PopupMenuItem(
                          value: "Wallpaper",
                          child: Text("Wallpaper"),
                        ),
                      ];
                    },
                  );
                }
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  const PopupMenuItem(
                    value: "Edit",
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem(
                    value: "All media",
                    child: Text("All media"),
                  ),
                  const PopupMenuItem(
                    value: "Show in chat",
                    child: Text("Show in chat"),
                  ),
                  const PopupMenuItem(
                    value: "Share",
                    child: Text("Share"),
                  ),
                  const PopupMenuItem(
                    value: "Save",
                    child: Text("Save"),
                  ),
                  PopupMenuItem(
                    value: "Set",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Set as..."),
                        Icon(
                          Icons.arrow_right,
                          color: kTextColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: "View in gallery",
                    child: Text("View in gallery"),
                  ),
                  const PopupMenuItem(
                    value: "Rotate",
                    child: Text("Rotate"),
                  ),
                  const PopupMenuItem(
                    value: "Delete",
                    child: Text("Delete"),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
