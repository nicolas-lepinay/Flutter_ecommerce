import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.64;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = ""; // Needs to be initialized anyway because of "late"
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              size: Dimensions.font16,
              color: AppColors.paraColor,
              height: 1.6,
            )
          : Column(
              children: [
                SmallText(
                  text: hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                  size: Dimensions.font16,
                  color: AppColors.paraColor,
                  height: 1.6,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                          text: hiddenText ? "Voir plus" : "Voir moins",
                          color: AppColors.mainColor),
                      Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                          color: AppColors.mainColor),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
