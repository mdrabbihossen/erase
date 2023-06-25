import 'dart:io';

import 'package:erase/views/home/widgets/bottom_navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        loaded = true;
      });
    }
  }

  // pick image end

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.sort_rounded),
        title: const Text("Erase: Remove Background"),
      ),
      body: imagePicked
          ? Center(
              child: Container(
                height: size.height * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(imagePath),
                    ),
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Upload an image to remove the background",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff454545),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                  ),
                  child: ElevatedButton(
                      onPressed: () => pickImage(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0f70e6),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: Size(
                          double.infinity,
                          size.height * 0.09,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.upload_sharp,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Upload Image",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
      bottomNavigationBar: BottomNav(
        onPress: loaded ? () {} : null,
      ),
    );
  }
}
