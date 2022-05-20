import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:davinci/davinci.dart';
import 'package:qr_code_scanner_example/main.dart';

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();

  GlobalKey? imageKey;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
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
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () async {
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
                          fileName: "QR code",
                          saveToDevice: true,
                          openFilePreview: true,
                          albumName: 'QR code');
                    },
                    child: const Text(
                      "Take Picture",
                    )),
                Row(
                  children: [
                    Expanded(child: buildTextField(context)),
                    const SizedBox(width: 12),
                    FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(Icons.done, size: 30),
                      onPressed: () => setState(() {}),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: const TextStyle(color: Colors.grey),
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
