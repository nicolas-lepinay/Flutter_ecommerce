import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce/routes/route_helper.dart';
import 'package:flutter_ecommerce/utils/app_constants.dart';
import 'package:flutter_ecommerce/widgets/app_column.dart';
import 'package:flutter_ecommerce/widgets/icon_and_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  // double _height = 220;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  // Dispose : disable widget when user leaves the page, to prevent memory leak
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // POPULAR FOOD SLIDESHOW :
        // Wrap component with a GetBuilder<controller-class> :
        GetBuilder<PopularProductController>(builder: (controller) {
          return controller.isLoaded
              ? Container(
                  //height: 300,
                  height: Dimensions.pageView, // Responsive height
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: controller.popularProductList.length,
                    itemBuilder: (context, index) {
                      return _buildPageItem(index, controller.popularProductList[index]);
                    },
                  ),
                )
              : CircularProgressIndicator(color: AppColors.mainColor);
        }),
        // DOTS INDICATOR :
        // Wrapped with a GetBuilder to get length of list (= number of dots)
        GetBuilder<PopularProductController>(builder: (controller) {
          return DotsIndicator(
            dotsCount:
                controller.popularProductList.isEmpty ? 1 : controller.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.mainColor,
            ),
          );
        }),
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.height15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                BigText(text: "Recommandés"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BigText(text: "•", color: Colors.black12),
                ),
                Container(
                  child: SmallText(text: "Recettes"),
                ),
              ],
            ),
          ),
        ),
        // RECOMMENDED FOOD LIST :
        GetBuilder<RecommendedProductController>(builder: (controller) {
          return controller.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), // List is not scrollable
                  // See doc :
                  //"If the scroll view does not shrink wrap, then the scroll view will expand
                  //to the maximum allowed size in the scrollDirection.
                  //If the scroll view has unbounded constraints in the scrollDirection,
                  //then shrinkWrap must be true."
                  shrinkWrap: true, // Necessary (or wrap ListView in a Container to remove it)
                  itemCount: controller.recommendedProductList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getRecommendedFood(index));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: Dimensions.width20),
                      child: Row(
                        children: [
                          // IMAGE SECTION
                          Container(
                            // height: 120,
                            // width: 120,
                            height: Dimensions.listViewImageSize,
                            width: Dimensions.listViewImageSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38, // Placeholder while loading image
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(controller.recommendedProductList[index].img !=
                                        null
                                    ? "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/${controller.recommendedProductList[index].img}"
                                    : "assets/image/green-apples.webp"),
                              ),
                            ),
                          ),
                          // TEXT SECTION
                          Expanded(
                            child: Container(
                              //height: 100,
                              height: Dimensions.listViewTextContainerSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius20),
                                  bottomRight: Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: controller.recommendedProductList[index].name ??
                                            "Sans titre"),
                                    const Spacer(),
                                    // SmallText(
                                    //     text:
                                    //         controller.recommendedProductList[index].description ??
                                    //             ""),
                                    SmallText(
                                        text: "Bitter Oranges are often used in the Caribbeans"),
                                    const Spacer(flex: 2),
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
                                    const Spacer(flex: 3),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : CircularProgressIndicator(color: AppColors.mainColor);
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    // Current slide
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
      // Next slide
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
      // Previous slide
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              //height: 220,
              height: Dimensions.pageViewContainer, // Responsive height
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                borderRadius: BorderRadius.circular(Dimensions.radius30),

                color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(popularProduct.img != null
                      ? "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}/${popularProduct.img}"
                      : "assets/image/green-apples.webp"),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //height: 120,
              height: Dimensions.pageViewTextContainer, // Responsive height
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: AppColumn(text: popularProduct.name ?? "Sans titre"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
