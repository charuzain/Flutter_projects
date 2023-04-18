import 'package:flutter/cupertino.dart';

import 'constants.dart';



class CustomIconContent extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const CustomIconContent({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text!,
          style: kLabelTextStyle
        )
      ],
    );
  }
}