import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/app_icon.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/expandable_text.dart';
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
          // BACKGROUND IMAGE
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
          // BACK BUTTON & ADD TO CART BUTTON
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
          // WHITE CARD
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
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        //height: 120,
        height: Dimensions.bottomHeightBar,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20, horizontal: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(children: [
                Icon(Icons.remove, color: AppColors.signColor),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: BigText(text: "0"),
                ),
                Icon(Icons.add, color: AppColors.signColor),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20, horizontal: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: BigText(text: "10.00€ | Ajouter", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
