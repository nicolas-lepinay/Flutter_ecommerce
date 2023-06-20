import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_ecommerce/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/pages/home/main_food_page.dart';
import 'package:flutter_ecommerce/routes/route_helper.dart';
import 'package:flutter_ecommerce/utils/app_constants.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/app_icon.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width10,
            right: Dimensions.width10,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height20),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  List<CartModel> _cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (_, index) => Container(
                        height: 100,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Returns the index of the product inside popularProductList (or -1)
                                var popularIndex = Get.find<PopularProductController>()
                                    .popularProductList
                                    .indexOf(_cartList[index].product!);

                                if (popularIndex >= 0) {
                                  // Goes to popular product whose index is popularIndex
                                  Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));
                                } else {
                                  // Product not found in PopularProduct list : try Recommended list
                                  var recommendedIndex = Get.find<RecommendedProductController>()
                                      .recommendedProductList
                                      .indexOf(_cartList[index].product!);

                                  // Goes to recommended product whose index is recommendedIndex
                                  Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex));
                                }
                              },
                              child: Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/${cartController.getItems[index].img!}"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                        text: cartController.getItems[index].name!,
                                        color: Colors.black54),
                                    SmallText(text: "Fabriqués en France"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                            text: "${cartController.getItems[index].price!}.00€",
                                            color: Colors.redAccent),
                                        Container(
                                          padding:
                                              EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(Dimensions.radius20),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                color: AppColors.signColor,
                                                onPressed: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!, -1);
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Dimensions.width10 / 2),
                                                child: BigText(
                                                    text: _cartList[index].quantity.toString()),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                color: AppColors.signColor,
                                                onPressed: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!, 1);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
