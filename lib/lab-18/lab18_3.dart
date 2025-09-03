import 'package:flutter/material.dart';

class DynamicFontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double fontSize;
    if (width < 400) {
      fontSize = 16;
    } else if (width < 800) {
      fontSize = 24;
    } else {
      fontSize = 32;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Font Size Example"),
      ),
      body: Center(
        child: Text(
          "Responsive Font Size\nScreen Width: $width",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
