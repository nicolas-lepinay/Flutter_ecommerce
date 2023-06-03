import 'package:flutter_ecommerce/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  // Underscore variables are private
  List<dynamic> _popularProductList = [];

  // This public variable can be called from UI
  List<dynamic> get popularProductList => _popularProductList;

  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = []; // Empty the list first so we never get repeated data
      //_popularProductList.addAll(); // Add response data to the list
      update(); // Update UI like a setState
    } else {}
  }
}
