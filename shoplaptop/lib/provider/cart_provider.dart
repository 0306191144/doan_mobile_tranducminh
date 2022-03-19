import 'package:flutter/material.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/carts.dart';

class CartsProvider extends ChangeNotifier {
  List<dynamic> _myCart = [];

  get getMyCart => _myCart;

  isExist(data) {
    for (var i = 0; i < _myCart.length; i++) {
      if (_myCart[i].product.id == data['product_id']) {
        return true;
      }
    }
    return false;
  }

  getCart() async {
    if (_myCart.isEmpty) {
      Map<String, dynamic> response = await Api().get('cart/list');
      if (response['success'] != null && response['success']) {
        var carts =
            response['data'].map((data) => Cart.fromJson(data)).toList();
        _myCart = carts;
      }
      notifyListeners();
    }
  }

  set(data) {
    _myCart = data;
  }

  void add(data) {
    _myCart.add(data);
    notifyListeners();
  }

  void delete(data) {
    _myCart.removeWhere((element) => element.id == data.id);
    notifyListeners();
  }

  void remove() {
    _myCart = [];
    notifyListeners();
  }

  void update(data) {
    var index = _myCart.indexWhere((element) => element.id == data.id);
    _myCart[index] = data;
    notifyListeners();
  }
}
