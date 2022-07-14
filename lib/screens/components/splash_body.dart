import 'package:flutter/material.dart';

import '../../constants.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(
            flex: 3,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 70,
            width: 70,
          ),
          const Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(kMedPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "from",
                  style: TextStyle(
                      color: kTextColor.withOpacity(0.6),
                      wordSpacing: 1,
                      fontSize: 14),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/meta.png',
                        color: kSecondaryColor,
                        height: 25,
                        width: 25,
                      ),
                      const Text(
                        " Meta",
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 18,
                            fontFamily: 'PT Sans'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
