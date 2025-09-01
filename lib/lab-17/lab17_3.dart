import 'package:flutter/material.dart';

void main() {
  runApp(ResponsivePaddingApp());
}

class ResponsivePaddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsivePaddingPage(),
    );
  }
}

class ResponsivePaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Apply responsive padding
    final double paddingValue = width > 700 ? 50.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Padding Example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              "Screen width: $width\nPadding: $paddingValue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
