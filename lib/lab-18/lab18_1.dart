import 'package:flutter/material.dart';

void main() {
  runApp(ResponsiveGridApp());
}

class ResponsiveGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveGridPage(),
    );
  }
}

class ResponsiveGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Decide number of columns based on screen width
    int crossAxisCount;
    if (width < 600) {
      crossAxisCount = 2; // Mobile
    } else if (width < 900) {
      crossAxisCount = 3; // Tablet
    } else {
      crossAxisCount = 5; // Web/Desktop
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Grid Layout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Item ${index + 1}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
