import 'package:flutter/material.dart';

class Checker extends StatelessWidget {
  const Checker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        color: Colors.red,
        height: 50,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   color: Colors.red,
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            "assets/images/user1.jpg",
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
