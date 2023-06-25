import 'dart:io';

import 'package:erase/views/home/widgets/bottom_navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loaded = false;
  bool imagePicked = false;
  Uint8List image = Uint8List(0);
  String imagePath = "";

  // pick image from gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (image != null) {
      setState(() {
        imagePath = image.path;
        imagePicked = true;
      });
    }
  }

  // pick image end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.sort_rounded),
        title: const Text("Erase: Remove Background"),
      ),
      body: imagePicked
          ? Image.file(File(imagePath))
          : Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Remove Background"),
              ),
            ),
      bottomNavigationBar: BottomNav(
        onPress: loaded ? () {} : null,
      ),
    );
  }
}
