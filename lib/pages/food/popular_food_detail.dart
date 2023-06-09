import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_ecommerce/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/routes/route_helper.dart';
import 'package:flutter_ecommerce/utils/app_constants.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/app_icon.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../widgets/app_column.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    PopularProductController controller = Get.find<PopularProductController>();
    ProductModel product = controller.popularProductList[pageId];
    controller.initProduct(Get.find<CartController>()); // Reset product quantity to 0

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.img != null
                      ? "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/${product.img}"
                      : "assets/image/green-apples.webp)"),
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
              children: [
                GestureDetector(
                    onTap: () {
                      //Get.back(); // Get.back() DELETES CONTROLLERS FROM MEMORY !
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
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
                  AppColumn(text: product.name ?? "Sans titre"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Description"),
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description ?? "Aucune description."),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return Container(
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
                    vertical: Dimensions.height10, horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: AppColors.signColor,
                      onPressed: () {
                        controller.setQuantity(false);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: BigText(text: controller.quantity.toString()),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: AppColors.signColor,
                      onPressed: () {
                        controller.setQuantity(true);
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height20, horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child:
                      BigText(text: "${product.price ?? 0}.00€  |  Ajouter", color: Colors.white),
                ),
                onTap: () {
                  controller.addItem(product);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
