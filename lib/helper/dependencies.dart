import 'package:flutter_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_ecommerce/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce/controllers/recommended_product_controller.dart';

import 'package:flutter_ecommerce/data/api/api_client.dart';
import 'package:flutter_ecommerce/data/repository/cart_repo.dart';
import 'package:flutter_ecommerce/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // 1. Load API Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // 2. Load repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // Needs API Client
  Get.lazyPut(() => RecomendedProductRepo(apiClient: Get.find())); // Needs API Client
  Get.lazyPut(() => CartRepo());

  // 3. Load controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find())); // Needs Repo
  Get.lazyPut(() => CartController(cartRepo: Get.find())); // Needs Repo
}
