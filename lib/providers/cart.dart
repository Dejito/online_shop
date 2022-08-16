import 'package:flutter/material.dart';

class CartItem {

  late final String id;
  late final String title;
  late final int quantity;
  late final double price;
  final String? productId;


  CartItem ({required this.id, required this.title, required this.price, required this.quantity,  this.productId});

}

class Cart with ChangeNotifier {

    Map <String, CartItem> _items = { };

  Map<String, CartItem> get items {
    return _items;
  }


  void addItems (String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id, title: existingCartItem.title, price: existingCartItem.price, quantity: existingCartItem.quantity+1));
      //
    }else {
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString() , title: title, price: price, quantity: 1,));
    }
    notifyListeners();
  }

  int get numberOfItems {
    return _items.length;
}

  double get totalAmount {
    var total = 0.00;
    items.forEach((key, cartItem) {
      total+= cartItem.price * cartItem.quantity;
    });  return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
   void clear() {
     _items = {};
     notifyListeners();
   }

}