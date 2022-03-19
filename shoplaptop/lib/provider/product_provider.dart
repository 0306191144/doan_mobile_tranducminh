// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/Model/user.dart';

class ProductsProvider extends ChangeNotifier {
  List<dynamic> _myProduct = [];
  get myValue => _myProduct;

  // ignore: non_constant_identifier_names
  var _myProduct_new = [];
  get mynew => _myProduct_new;

  getProducts() async {
    if (_myProduct.isEmpty) {
      Map<String, dynamic> response = await Api().get('products/list_product');
      if (response['success'] != null && response['success']) {
        var products =
            response['data'].map((data) => Product.fromJson(data)).toList();
        _myProduct = products;
        notifyListeners();
      }
    }
  }

  // ignore: non_constant_identifier_names
  getProducts_new() async {
    if (_myProduct.isEmpty) {
      Map<String, dynamic> response =
          await Api().get('products/list_product/new');
      if (response['success'] != null && response['success']) {
        var products =
            response['data'].map((data) => Product.fromJson(data)).toList();
        _myProduct_new = products;
        notifyListeners();
      }
    }
  }
}
