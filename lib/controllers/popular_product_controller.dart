import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_ecommerce/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
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
  // Gets reset to 0 for logic reason, unlike _inCartItems
  int _quantity = 0;
  int get quantity => _quantity;

  // Combien de fois un produit X spécifique a été ajouté au panier ?
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
      if (_inCartItems + _quantity < 10) _quantity = _quantity + 1;
    } else {
      if (_inCartItems + _quantity > 0) _quantity = _quantity - 1;
    }
    update(); // Update UI
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }

    // Get from storage
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0; // ??? Voir 09:56:00 à la vidéo 1...
    // ...probablement pour que la page produit n'affiche pas la dernière quantité ajoutée sur toutes les pages produits
    _inCartItems = _cart.getQuantity(product); // ??? Inutile chez moi (voir 10:17:00 de la vidéo 1)
    _cart.items.forEach((key, value) {
      print(
          "Product ID is ${value.id.toString()} and quantity in cart is ${value.quantity.toString()}");
      update(); // Update UI (for the icon of number of items in cart)
    });
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
