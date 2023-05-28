import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SmallText(text: "4.5"),
            const SizedBox(width: 10),
            SmallText(text: "755 avis"),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidgets(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidgets(
              icon: Icons.location_on,
              text: "1.7 km",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidgets(
              icon: Icons.access_time_rounded,
              text: "35 min",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
