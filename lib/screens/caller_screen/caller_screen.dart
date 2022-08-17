import 'package:flutter/material.dart';

class CallerScreen extends StatelessWidget {
  const CallerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.45,
              image: AssetImage('assets/images/dark background.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
