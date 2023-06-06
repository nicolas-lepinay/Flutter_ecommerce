import 'package:flutter_ecommerce/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecomendedProductRepo recommendedProductRepo;

  // Underscore variables are private
  List<ProductModel> _recommendedProductList = [];

  // This public variable can be called from UI
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  RecommendedProductController({required this.recommendedProductRepo});

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = []; // Empty the list first so we never get repeated data
      _recommendedProductList
          .addAll(Product.fromJson(response.body).products); // Add response data to the list
      _isLoaded = true;
      update(); // Update UI like a setState
    } else {
      print("FAIL");
    }
  }
}
