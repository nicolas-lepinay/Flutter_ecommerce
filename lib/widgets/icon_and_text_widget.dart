import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/small_text.dart';

class IconAndTextWidgets extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidgets(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
