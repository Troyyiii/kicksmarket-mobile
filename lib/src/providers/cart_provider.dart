import 'package:flutter/material.dart';
import 'package:kicksmarket/src/models/cart_model.dart';
import 'package:kicksmarket/src/models/shoes_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ShoesModel shoes) {
    if (shoesExist(shoes)) {
      int index = _carts.indexWhere((element) => element.shoes.id == shoes.id);
      _carts[index].quantity++;
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        shoes: shoes,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  removeCart(CartModel cart) {
    _carts.removeWhere((element) => element.hashCode == cart.hashCode);
    notifyListeners();
  }

  addQuantity(CartModel cart) {
    cart.quantity++;
    notifyListeners();
  }

  reduceQuantity(CartModel cart) {
    cart.quantity--;
    if (cart.quantity == 0) {
      _carts.removeWhere((element) => element.hashCode == cart.hashCode);
    }
    notifyListeners();
  }

  totalItem() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.shoes.price);
    }
    return total;
  }

  shoesExist(ShoesModel shoes) {
    if (_carts.indexWhere((element) => element.shoes.id == shoes.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
