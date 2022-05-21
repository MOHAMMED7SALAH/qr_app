import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:davinci/davinci.dart';

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();

  GlobalKey? imageKey;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create QR Code', style: const TextStyle(
                color: Colors.white,
                 fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xff14C944),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Davinci(builder: (key) {
                  imageKey = key;
                  return BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    color: Colors.white,
                    data: controller.text ,
                    width: 200,
                    height: 200,
                  );
                }),
                SizedBox(height: size.height * 0.1),
                buildTextField(context),
                                SizedBox(height: size.height * 0.1),

                InkWell(
                onTap: () async {
                    Get.showSnackbar(const GetSnackBar(
                      titleText: Center(
                          child: Text('Congratulation 🥳🎉',
                              style: TextStyle(color: Colors.white))),
                      messageText: Center(
                        child: Text(
                          "The QR code photo is in your gallerie",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      duration: Duration(seconds: 7),
                      snackPosition: SnackPosition.TOP,
                      margin: EdgeInsets.only(top: 100.0),
                      backgroundColor: Colors.green,
                      borderRadius: 20,
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    ));
                   
                    await DavinciCapture.click(imageKey!,
                        fileName: "code",
                        saveToDevice: true,
                        openFilePreview: true,
                        albumName: 'QR code');
                  },
                child: Container(
                  height: size.width * .12,
                  width: size.width * .7,
                  decoration: BoxDecoration(
                    color: Color(0xff14C944),
                    borderRadius: BorderRadius.circular(36),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Download QR code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      );
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        onChanged: (value) => setState(() {}),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
}
