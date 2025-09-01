import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbarexample extends StatelessWidget {
  const Snackbarexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnackBar'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Snack bar showed",
              'working complitly fine',
              icon: Icon(Icons.account_balance),
              shouldIconPulse: true,
              snackPosition: SnackPosition.BOTTOM,
              backgroundGradient: LinearGradient(
                colors: [Color(0xFF25C263), Color(0xFF0575E6)],
              ),
            );
          },
          child: Text('Click'),
        ),
      ),
    );
  }
}
