import 'package:flutter/material.dart';
import 'dart:io';
import '../../db/uplloadingLoction.dart';
import '../../db/uploadingReportDis.dart';
import '../../db/uplodingImage.dart';
import '../../widgets/services_widget/Button_widget.dart';
import '../Loction.dart';
import '../imagePicker.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class QR extends StatefulWidget {
  var categoryTitle = '';
  var categoryId = '';
  QR(this.categoryTitle, this.categoryId);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  final String report = 'Service';
  String qrCode = 'Unknown';


  @override
  Widget build(BuildContext context) {



    // final routArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(

        appBar: AppBar(
            centerTitle: true,
            title: Text(widget.categoryTitle.toString()),
            backgroundColor: Colors.brown),
        body: Stack(

          children: [
            Container(

              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backg.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Scan Result',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '$qrCode',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 72),
                  ButtonWidget(
                    text: 'Start QR scan',
                    onClicked: () => scanQRCode(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
