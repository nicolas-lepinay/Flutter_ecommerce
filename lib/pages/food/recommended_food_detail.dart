import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_ecommerce/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/pages/cart/cart_page.dart';
import 'package:flutter_ecommerce/routes/route_helper.dart';
import 'package:flutter_ecommerce/utils/app_constants.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/app_icon.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    RecommendedProductController controller = Get.find<RecommendedProductController>();
    ProductModel product = controller.recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false, // Removes automatic back arrow
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const AppIcon(icon: Icons.clear)),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1) Get.toNamed(RouteHelper.getCart());
                      },
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AppIcon(
                                          icon: Icons.circle,
                                          size: 20,
                                          iconColor: Colors.transparent,
                                          backgroundColor: AppColors.mainColor),
                                      BigText(
                                        text: controller.totalItems.toString(),
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            backgroundColor: AppColors.mainColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(text: product.name ?? "Sans titre", size: Dimensions.font26),
                ),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.img != null
                    ? "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/${product.img}"
                    : "assets/image/green-apples.webp)",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableText(text: product.description ?? "Aucune description."),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize
              .min, // Because column takes all parent's height (screen's height) by default
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 2, vertical: Dimensions.height20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24),
                  ),
                  BigText(
                      text: " ${product.price ?? 0}.00€   ×   ${controller.inCartItems} ",
                      size: Dimensions.font26),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24),
                  ),
                ],
              ),
            ),
            Container(
              //height: 120,
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height30, horizontal: Dimensions.width20),
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
                    child: Icon(Icons.favorite, color: AppColors.mainColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height20, horizontal: Dimensions.width20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                      ),
                      child:
                          BigText(text: "${product.price!}.00€  |  Ajouter", color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
