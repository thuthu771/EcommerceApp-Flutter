import 'package:flutter/material.dart';
import 'package:online_ui/api/shoppingapi.dart';

class cart with ChangeNotifier {
  final List<int> _cartitem = [];
  List<int> get cartitem => _cartitem;
  static List cartitemprice = [];

  int? productID;
  Shoppingimg? productDatas;
  double _total = 0.0;
  double get totalPrice => _total;

  void addtocart(int id) {
    _cartitem.add(id);
    notifyListeners();
  }

  void removefromcart(int id) {
    _cartitem.remove(id);
    notifyListeners();
  }

  void totalpr() {
    cartitemprice = _cartitem.map((productid) {
      final product = productDatas!.imageUrl!.firstWhere(
        (p) => p.id == productid,
      );
      return product.price;
    }).toList();
    _total = cartitemprice.fold(0.0, (acc, price) => acc + price);
  }
}
