import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: const Text("Scan QR code"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(kMedPadding),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    "To use WhatsApp Web, go to web.whatsapp.com in your computer.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19, wordSpacing: 2.0),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.76,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
