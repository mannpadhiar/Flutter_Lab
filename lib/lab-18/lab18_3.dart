import 'package:flutter/material.dart';

void main() {
  runApp(DynamicFontApp());
}

class DynamicFontApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DynamicFontPage(),
    );
  }
}

class DynamicFontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Set font size dynamically
    double fontSize;
    if (width < 400) {
      fontSize = 16; // Small screen
    } else if (width < 800) {
      fontSize = 24; // Medium screen
    } else {
      fontSize = 32; // Large screen
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
