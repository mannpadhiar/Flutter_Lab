import 'package:flutter/material.dart';
import 'package:custom_package/custom_package.dart';

class CustomPackageExample extends StatefulWidget {
  const CustomPackageExample({super.key});

  @override
  State<CustomPackageExample> createState() => _CustomPackageExampleState();
}

class _CustomPackageExampleState extends State<CustomPackageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello'),),
      body: Center(
        child: Column(
          children: [
            Text(PrintHello.greet('mann')),
          ],
        ),
      ),
    );
  }
}
