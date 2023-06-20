import 'package:flutter_ecommerce/pages/cart/cart_page.dart';
import 'package:flutter_ecommerce/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce/pages/food/recommended_food_detail.dart';
import 'package:flutter_ecommerce/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cart = "/cart";

  static String getInitial() => "$initial";

  static String getPopularFood(int pageId, [String? previousPage]) =>
      "$popularFood?pageId=$pageId&previousPage=$previousPage";

  static String getRecommendedFood(int pageId, [String? previousPage]) =>
      "$recommendedFood?pageId=$pageId&previousPage=$previousPage";

  static String getCart() => "$cart";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFood,
      transition: Transition.fadeIn,
      page: () {
        var pageId = Get.parameters["pageId"];
        var previousPage = Get.parameters["previousPage"];

        return PopularFoodDetail(pageId: int.parse(pageId ?? '0'), previousPage: previousPage);
      },
    ),
    GetPage(
      name: recommendedFood,
      transition: Transition.fadeIn,
      page: () {
        var pageId = Get.parameters["pageId"];
        var previousPage = Get.parameters["previousPage"];

        return RecommendedFoodDetail(pageId: int.parse(pageId ?? '0'), previousPage: previousPage);
      },
    ),
    GetPage(
      name: cart,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
