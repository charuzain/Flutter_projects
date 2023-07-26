import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImage extends StatefulWidget {
  const UserImage({super.key, required this.selectImageFile});

  final void Function(File selectedFile) selectImageFile;

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? pickedImageFile;

  void takeImage() async {
    final ImagePicker picker = ImagePicker();
    final imageClicked = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    // image can be null if we close the camera without taking any picture
    if (imageClicked == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(imageClicked.path);
    });

    widget.selectImageFile(pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            // FileImage yield imageProvider and foregroundImage use imageProvider
            foregroundImage:
                pickedImageFile != null ? FileImage(pickedImageFile!) : null),
        const SizedBox(
          height: 15,
        ),
        TextButton.icon(
            onPressed: takeImage,
            icon: const Icon(Icons.image),
            label: const Text("Add Image")),
      ],
    );
  }
}
