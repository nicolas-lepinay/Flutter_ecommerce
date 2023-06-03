import 'package:flutter_ecommerce/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce/data/api/api_client.dart';
import 'package:flutter_ecommerce/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // 1. Load API Client
  Get.lazyPut(() => ApiClient(appBaseUrl: "my-url"));

  // 2. Load repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // Needs API Client

  // 3. Load controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find())); // Needs Repo
}
