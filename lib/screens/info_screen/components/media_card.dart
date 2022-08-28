import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../chat_screen/components/image_preview.dart';
import '../info_screen.dart';

class MediaBuilderCard extends StatelessWidget {
  const MediaBuilderCard({Key? key, required this.widget}) : super(key: key);

  final InfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kMedPadding),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.21,
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(kLargePadding),
                  child: Text(
                    'Media, links, and docs',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kDarkGreyColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kLargePadding),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 16,
                        child: Text(
                          '81',
                          style: TextStyle(
                            fontSize: 14,
                            color: kDarkGreyColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: kDarkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: kMedPadding),
              child: SizedBox(
                width: double.infinity,
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.chat.images.length + 1,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageViewer(
                                    image: widget.chat.images[i],
                                    name: widget.chat.name,
                                    isSender: false,
                                    time: widget.chat.time)));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: kSmallPadding / 1.5),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: (i != widget.chat.images.length)
                              ? Image.asset(
                                  widget.chat.images[i],
                                  fit: BoxFit.fitWidth,
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(
                                      top: kLargePadding,
                                      right: kLargePadding * 2.5,
                                      left: kLargePadding * 2.5,
                                      bottom: kLargePadding),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 22,
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
