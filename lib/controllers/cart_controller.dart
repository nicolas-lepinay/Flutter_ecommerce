import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/data/repository/cart_repo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  CartController({required this.cartRepo});

  void addItem(ProductModel product, int quantity) {
    int totalQuantity = 0;
    // If product is already in the cart Map, update its quantity
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
      // Supprimer le produit du panier si sa quantité est égale à 0
      if (totalQuantity <= 0) {
        _items.remove(product.id);
        Get.snackbar(
          "Article supprimé",
          "L'article a été supprimé de votre panier.",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    } else {
      if (quantity > 0) {
        // If product is not in the cart Map yet, add it
        _items.putIfAbsent(
          product.id,
          () => CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString()),
        );
      } else {
        Get.snackbar(
          "Aucun produit sélectionné",
          "Veuillez sélectionner au moins 1 produit.",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
  }

  // Check if product is in cart or not when popular_food_detail launches
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
