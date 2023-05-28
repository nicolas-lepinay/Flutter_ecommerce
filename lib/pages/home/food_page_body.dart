import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/app_column.dart';
import 'package:flutter_ecommerce/widgets/icon_and_text_widget.dart';

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
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SLIDESHOW :
        Container(
          //height: 300,
          height: Dimensions.pageView, // Responsive height
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        // DOTS INDICATOR :
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            activeColor: AppColors.mainColor,
          ),
        ),
        // POPULAR ITEMS :
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.height15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                BigText(text: "Populaires"),
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
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(), // List is not scrollable
          // See doc :
          //"If the scroll view does not shrink wrap, then the scroll view will expand
          //to the maximum allowed size in the scrollDirection.
          //If the scroll view has unbounded constraints in the scrollDirection,
          //then shrinkWrap must be true."
          shrinkWrap: true, // Necessary (or wrap ListView in a Container to remove it)
          itemCount: 10,
          itemBuilder: (context, index) => Container(
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
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/blueberry-cheesecake.webp"),
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
                          BigText(text: "Cheesecake aux myrtilles"),
                          Spacer(),
                          SmallText(text: "Cheesecake sans cuisson"),
                          Spacer(flex: 2),
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
                          Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
          Container(
            //height: 220,
            height: Dimensions.pageViewContainer, // Responsive height
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(30),
              borderRadius: BorderRadius.circular(Dimensions.radius30),

              color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/green-apples.webp"),
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
                child: AppColumn(text: "Pommes"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
