import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.pickedImage});

  final void Function(File image) pickedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _tookImage;

  void _handleTakePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _tookImage = File(pickedImage.path);
    });
    widget.pickedImage(_tookImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.white24)),
      alignment: Alignment.center,
      height: 300,
      width: double.infinity,
      child: _tookImage != null
          ? GestureDetector(
              onTap: _handleTakePicture,
              child: Image.file(
                _tookImage!,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            )
          : TextButton.icon(
              onPressed: _handleTakePicture,
              icon: const Icon(Icons.camera_enhance),
              label: const Text("Take Picture"),
            ),
    );
  }
}
