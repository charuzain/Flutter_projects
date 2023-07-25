import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImage extends StatefulWidget {
  const UserImage({
    super.key,
  });

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? pickedImage;

  void takeImage() async {
    final ImagePicker picker = ImagePicker();
    final imageClicked = await picker.pickImage(source: ImageSource.camera);
    if (imageClicked == null) {
      return;
    }
    setState(() {
      pickedImage = File(imageClicked.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            foregroundImage:
                pickedImage != null ? FileImage(pickedImage!) : null),
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
