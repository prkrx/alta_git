import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode demo'),
      ),
      body: Column(
        children: <Widget>[

          _BarcodeWidget1(),
          _BarcodeWidget2(),
          _BarcodeWidget3()
        ],
      )
    );
  }
}

Widget _BarcodeWidget1() {
  return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          BarcodeWidget(
            barcode: Barcode.qrCode(
              errorCorrectLevel: BarcodeQRCorrectionLevel.high,
            ),
            data: 'Altera Academy',
            width: 150,
            height: 150,
          ),
          Container(
            color: Colors.white,
            width: 60,
            height: 60,
            child: const FlutterLogo(),
          ),
        ],
      )
  );
}




Widget _BarcodeWidget2() {
  return Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            BarcodeWidget(
              barcode: Barcode.qrCode(
                errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              ),
              data: 'Flutter Asik',
              width: 150,
              height: 150,
            ),
            Container(
              color: Colors.white,
              width: 60,
              height: 60,
              child: const FlutterLogo(),
            ),
          ],
        )
  );
}

Widget _BarcodeWidget3() {
  return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          BarcodeWidget(
            barcode: Barcode.qrCode(
              errorCorrectLevel: BarcodeQRCorrectionLevel.high,
            ),
            data: 'Richo Dwi Wardiyanto Romadhon',
            width: 150,
            height: 150,
          ),
          Container(
            color: Colors.white,
            width: 60,
            height: 60,
            child: const FlutterLogo(),
          ),
        ],
      )
  );
}





