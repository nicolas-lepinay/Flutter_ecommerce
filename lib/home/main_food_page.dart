import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/food_page_body.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';

import '../utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HEADER SECTION :
            Container(
              // Scrolling parameter to insert here (later)
              child: Container(
                margin: const EdgeInsets.only(top: 45, bottom: 15),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "France", color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: "Aix-en-Provence", color: Colors.black54),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(15),
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                        child: const Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // BODY SECTION :
            FoodPageBody(),
          ],
        ),
      ),
    );
  }
}
