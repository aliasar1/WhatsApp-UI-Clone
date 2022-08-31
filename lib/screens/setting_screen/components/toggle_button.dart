import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../theme.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      activeColor: Theme.of(context).primaryColorLight,
      activeTrackColor: kSecondaryColor.withOpacity(0.4),
      inactiveThumbColor: kDarkGreyColor,
      inactiveTrackColor: kIconColor,
    );
  }
}
