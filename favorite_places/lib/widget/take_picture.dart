import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TakePicture extends StatefulWidget {
  const TakePicture({super.key, required this.getNewImage});

  final void Function(File image) getNewImage;

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  File? selectedImage;

  void takePic() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 800);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(pickedImage.path);
    });
    widget.getNewImage(selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedImage != null) {
      return GestureDetector(
        onTap: takePic,
        child: Container(
            height: 300,
            width: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
            child: Image.file(
              selectedImage!,
              fit: BoxFit.cover,
            )),
      );
    }
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      height: 300,
      width: double.infinity,
      alignment: Alignment.center,
      child: TextButton.icon(
          onPressed: takePic,
          icon: const Icon(Icons.camera),
          label: const Text("Take a picture")),
    );
  }
}
