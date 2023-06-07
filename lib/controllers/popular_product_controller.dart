import 'package:flutter_ecommerce/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  // Underscore variables are private
  List<ProductModel> _popularProductList = [];

  // This public variable can be called from UI
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = []; // Empty the list first so we never get repeated data
      _popularProductList
          .addAll(Product.fromJson(response.body).products); // Add response data to the list
      _isLoaded = true;
      update(); // Update UI like a setState
    } else {
      print("FAIL");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _quantity + 1;
    } else {
      if (_quantity > 0) _quantity = _quantity - 1;
    }
    update(); // Update UI
  }
}
