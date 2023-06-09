import 'package:flutter_ecommerce/data/repository/cart_repo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  CartController({required this.cartRepo});

  void addItem(ProductModel product, int quantity) {
    // If product is already in the cart Map, update its quantity
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
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
      }
    }
  }
}
