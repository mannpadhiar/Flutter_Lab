import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloadExample extends StatefulWidget {
  const FileDownloadExample({super.key});

  @override
  State<FileDownloadExample> createState() => _FileDownloadExampleState();
}

class _FileDownloadExampleState extends State<FileDownloadExample> {
  String status = "Idle";
  double progress = 0.0;

  Future<String?> getPath() async {
    Directory? dir = await getExternalStorageDirectory();
    return dir?.path;
  }

  Future<void> downloadFile() async {
    try {
      String? path = await getPath();
      if (path == null) {
        setState(() => status = "Path not found ");
        return;
      }

      String url = "https://picsum.photos/400/600";
      String fileName = "downloaded_image.jpg";

      Dio dio = Dio();
      File file = File("$path/$fileName");

      await dio.download(
        url,
        file.path,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            setState(() {
              progress = count / total;
              status = "Downloading... ${(progress * 100).toStringAsFixed(0)}%";
            });
          }
        },
      );

      setState(() {
        status = "File downloaded at: ${file.path}";
      });
    } catch (e) {
      setState(() => status = "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Download File Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: downloadFile,
              child: const Text("Download File"),
            ),
            const SizedBox(height: 20),
            Text(status, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
            ),
          ],
        ),
      ),
    );
  }
}