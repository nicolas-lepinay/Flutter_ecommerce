import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double? size;
  TextOverflow overflow;

  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        //fontSize: size,
        fontSize: size ?? Dimensions.font20, // Responsive font size (or specific size if not null)
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
