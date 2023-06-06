import 'package:flutter_ecommerce/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce/pages/food/recommended_food_detail.dart';
import 'package:flutter_ecommerce/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood() => "$popularFood";
  static String getRecommendedFood() => "$recommendedFood";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFood,
      transition: Transition.fadeIn,
      page: () {
        return PopularFoodDetail();
      },
    ),
    GetPage(
      name: recommendedFood,
      transition: Transition.fadeIn,
      page: () {
        return RecommendedFoodDetail();
      },
    )
  ];
}
