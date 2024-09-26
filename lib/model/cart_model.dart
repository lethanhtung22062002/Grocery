import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  // List of items on sale
  final List _shopItems = [
    ["Avocado", "4.00", "assets/images/avocado.png", Colors.green],
    ["Banana", "2.50", "assets/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "assets/images/chicken.png", Colors.brown],
    ["Water", "1.00", "assets/images/water.png", Colors.blue],
  ];

  // List of cart items
  final List _cartItems = [];

  List get shopItems => _shopItems;

  List get cartItems => _cartItems;

  // Add item to cart
  void addToCart(item) {
    _cartItems.add(item);
    notifyListeners();
  }

  // Remove item from cart by item reference
  void removeFromCart(item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  // Remove item from cart by index
  void removeItemFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += double.parse(item[1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
