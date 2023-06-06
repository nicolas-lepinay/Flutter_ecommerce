import 'package:flutter_ecommerce/data/api/api_client.dart';
import 'package:flutter_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecomendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
