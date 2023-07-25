import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(
          height: 15,
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.image),
            label: const Text("Add Image")),
      ],
    );
  }
}
