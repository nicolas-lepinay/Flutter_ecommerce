import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:flutter_ecommerce/utils/dimensions.dart';
import 'package:flutter_ecommerce/widgets/app_icon.dart';
import 'package:flutter_ecommerce/widgets/big_text.dart';
import 'package:flutter_ecommerce/widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            backgroundColor: AppColors.mainColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                child: Center(
                  child: BigText(text: "Pommes", size: Dimensions.font26),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/green-apples.webp",
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
                  child: ExpandableText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna."),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize
            .min, // Because column takes all parent's height (screen's height) by default
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2, vertical: Dimensions.height20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24),
                BigText(text: " 3.50€ " + "  ×  " + " 0 ", size: Dimensions.font26),
                AppIcon(
                    icon: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24),
              ],
            ),
          ),
          Container(
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
                  child: Icon(Icons.favorite, color: AppColors.mainColor),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height20, horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: BigText(text: "10.00€  |  Ajouter", color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
