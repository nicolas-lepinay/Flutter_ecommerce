import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/app_icon.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce/widgets/small_text.dart';

import '../../widgets/app_column.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImageSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/green-apples.webp"),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.popularFoodImageSize - 20,
            bottom: 0, // So that the white card takes all available space down
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20, vertical: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Pommes"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Description"),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding:
            EdgeInsets.symmetric(vertical: Dimensions.height30, horizontal: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(children: [
                Icon(Icons.remove, color: AppColors.signColor),
                BigText(text: "0"),
                Icon(Icons.add, color: AppColors.signColor),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
