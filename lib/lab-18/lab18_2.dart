import 'package:flutter/material.dart';

void main() {
  runApp(ResponsiveWidgetApp());
}

class ResponsiveWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveWidgetPage(),
    );
  }
}

class ResponsiveWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isLargeScreen = width > 700;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Widgets Example"),
      ),
      body: Center(
        child: isLargeScreen
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.desktop_windows, size: 100, color: Colors.blue),
            Text(
              "Large Screen (Tablet / Web)",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 80, color: Colors.green),
            Text(
              "Small Screen (Mobile)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
