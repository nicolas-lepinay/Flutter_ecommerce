import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_ecommerce/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  // Underscore variables are private
  List<ProductModel> _popularProductList = [];

  // This public variable can be called from UI
  List<ProductModel> get popularProductList => _popularProductList;

  // Boolean for loading icon
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // Product's quantity added to cart
  int _quantity = 0;
  int get quantity => _quantity;

  // Total products in cart
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  late CartController _cart;

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
      if (_quantity < 10) _quantity = _quantity + 1;
    } else {
      if (_quantity > 0) _quantity = _quantity - 1;
    }
    update(); // Update UI
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // Get from storage
  }

  void addItem(ProductModel product) {
    if (quantity < 1) {
      Get.snackbar(
        "Aucun produit sélectionné",
        "Veuillez sélectionner au moins 1 produit.",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return;
    }
    _cart.addItem(product, _quantity);
    _quantity = 0; // ??? Voir 09:56:00 à la vidéo
    _cart.items.forEach((key, value) {
      print(
          "Product ID is ${value.id.toString()} and quantity in cart is ${value.quantity.toString()}");
    });
  }
}
