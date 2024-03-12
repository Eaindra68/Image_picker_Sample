import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/id_card.png'),
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      child: Text('Gallery')),
                  ElevatedButton(
                      onPressed: () {
                        _pickImageFromCamera();
                      },
                      child: Text('Camera')),
                ],
              )
            ],
          ),
        ));
  }

  void _pickImageFromGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery == null) return;
    setState(() {
      selectedImage = File(imageGallery.path);
      _image = File(imageGallery.path).readAsBytesSync();
    });
  }

  void _pickImageFromCamera() async {
    final imageCamera =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageCamera == null) return;
    setState(() {
      selectedImage = File(imageCamera.path);
      _image = File(imageCamera.path).readAsBytesSync();
    });
  }
}
