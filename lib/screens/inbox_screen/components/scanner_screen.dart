import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:whatsapp_clone/constants.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey _gLobalkey = GlobalKey();

  QRViewController? controller;
  Barcode? result;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

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
                height: 55,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.5,
                  child: Center(
                    child: Text(
                      "To use WhatsApp Web, go to web.whatsapp.com in your computer.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        wordSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.767,
                        width: double.infinity,
                        child: buildQrView(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: _gLobalkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutWidth: MediaQuery.of(context).size.width * 0.75,
            cutOutHeight: MediaQuery.of(context).size.height * 0.45,
            borderColor: kSecondaryColor,
            borderRadius: 5,
            borderLength: 25,
            borderWidth: 8),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
  }
}
