import 'package:flutter/material.dart';
import 'package:qr_code_scanner_example/page/qr_create_page.dart';
import 'package:qr_code_scanner_example/page/qr_scan_page.dart';
import 'package:qr_code_scanner_example/widget/button_widget.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({
    required this.title,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.3),
              ButtonWidget(
                lottie: 'assets/myqr.json',
                text: 'Create QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRCreatePage(),
                )),
              ),
             SizedBox(height: size.height * 0.1),
              ButtonWidget(
                lottie: 'assets/scan w.json',
                text: 'Scan QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRScanPage(),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
