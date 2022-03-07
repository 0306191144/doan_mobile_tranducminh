// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/product.dart';

class ProductsProvider extends ChangeNotifier {
  var _myProduct = [];
  get myValue => _myProduct;

  var _product = [];
  get value_new => _product;

  getProducts() async {
    if (_myProduct.isEmpty) {
      Map<String, dynamic> response = await Api().get('product/list_product');
      if (response['success'] != null && response['success']) {
        var products =
            response['data'].map((data) => Product.fromJson(data)).toList();
        print(products);
        _myProduct = products;
        notifyListeners();
      }
    }
  }

  getproducts_new() async {
    if (_myProduct.isEmpty) {
      Map<String, dynamic> response =
          await Api().get('product/list_product/new');
      if (response['success'] != null && response['success']) {
        var products =
            response['data'].map((data) => Product.fromJson(data)).toList();
        print(products);
        _product = products;
        notifyListeners();
      }
    }
  }

  postProduct($id) async {
    if (_myProduct.isEmpty) {
      Map<String, dynamic> response = await Api().post('products', $id);
      if (response['success'] != null && response['success']) {
        var products =
            response['data'].map((data) => Product.fromJson(data)).toList();
        _myProduct = products;
        notifyListeners();
      }
    }
  }

  void update(data) {
    _myProduct = data;
    notifyListeners();
  }
}
