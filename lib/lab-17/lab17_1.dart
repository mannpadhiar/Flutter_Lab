import 'package:flutter/material.dart';

void main() {
  runApp(ScreenSizeApp());
}

class ScreenSizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenSizePage(),
    );
  }
}

class ScreenSizePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery provides screen size
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Size Example"),
      ),
      body: Center(
        child: Text(
          "Width: $width px\nHeight: $height px",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
