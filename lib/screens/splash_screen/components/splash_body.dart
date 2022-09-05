import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(
            flex: 3,
          ),
          Image.asset(
            isDarkMode
                ? 'assets/images/dark logo.png'
                : 'assets/images/logo.png',
            height: 100,
            width: 100,
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
                      color: isDarkMode ? kDarkGreyColor : kDarkGreyColor,
                      wordSpacing: 1,
                      fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: kLargePadding * 2),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/meta.png',
                          color:
                              isDarkMode ? kBackgroundColor : kSecondaryColor,
                          height: 25,
                          width: 25,
                        ),
                        Text(
                          " Meta",
                          style: TextStyle(
                              color: isDarkMode
                                  ? kBackgroundColor
                                  : kSecondaryColor,
                              fontSize: 18,
                              fontFamily: 'PT Sans'),
                        ),
                      ],
                    ),
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
